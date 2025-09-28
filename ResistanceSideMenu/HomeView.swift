//
//  HomeView.swift
//  ResistanceSideMenu
//
//  Created by Ivan Voznyi on 9/28/25.
//

import SwiftUI

enum AppView: Decodable {
    case profile, settings, notifications
}

struct HomeView: View {
    @State var xoffset: CGFloat = 0
    @State var SidePosition: CGFloat = 0
    @State var show = false
    @State private var path = NavigationPath()
    
    private let menuWidthRatio: CGFloat = 1.5 // Defines menu width as 1/1.5 (2/3rds) of screen width.
    private let maxBlurRadius: CGFloat = 10.0  // Maximum blur applied to the side menu (e.g., when it's closed)
    
    // Controls how quickly the blur fades out as the menu opens
    private let blurSpeedFactorSideMenu: CGFloat = 20.0
    private let blurSpeedFactorMainContent: CGFloat = 10.0
    
    var body: some View {
        NavigationStack(path: $path) {
            GeometryReader { geometry in
                ZStack {
                    Group {
                        Text("Hello World!")
                            .font(Font.largeTitle.bold())
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .contentShape(Rectangle())
                            .background(
                                ZStack {
                                    Wave(frequency: 8, amplitude: 95, phase: 17.5)
                                        .fill(Color.gray.opacity(0.5))
                                        .frame(width: geometry.size.width * 2, height: 360)
                                        .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top + 90)
                                        .ignoresSafeArea()
                                    Wave(frequency: 8, amplitude: 95, phase: 1.5)
                                        .fill(Color.gray)
                                        .frame(width: geometry.size.width * 2, height: 360)
                                        .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top + 90)
                                        .ignoresSafeArea()
                                }
                            )
                    }
                    .navigationDestination(for: AppView.self) { viewCase in
                        switch viewCase {
                        case .profile:
                            ProfileView()
                        case .settings:
                            SettingsView()
                        case .notifications:
                            NotificationsView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(x: xoffset + SidePosition)
                    .slideOpacity(
                        xoffset: xoffset,
                        sidePosition: SidePosition,
                        fadeOut: true
                    )
                    .blur(radius: (xoffset + SidePosition) / blurSpeedFactorMainContent)
                    
                    SideView(path: $path) {
                        show.toggle()
                        SidePosition -= geometry.size.width / menuWidthRatio
                    }
                    .offset(x: -geometry.size.width / menuWidthRatio + xoffset + SidePosition)
                    .slideOpacity(
                        xoffset: xoffset,
                        sidePosition: SidePosition,
                        fadeOut: false
                    )
                    .blur(radius: max(0, maxBlurRadius - (xoffset + SidePosition) / blurSpeedFactorSideMenu))
                    .zIndex(1)
                }
                .gesture(
                    DragGesture()
                        .onChanged { gesture in
                            let rawDrag = gesture.translation.width
                            let menuWidth = geometry.size.width / menuWidthRatio
                            var drag: CGFloat
                            // Calculate the final position the content would reach if the raw drag were applied now.
                            let totalOffset = SidePosition + rawDrag
                            // Resistance factor: Controls the "squishiness" when dragging past the menu's open or closed limits.
                            // A higher value (e.g., 10) makes the movement stiffer; a lower value (e.g., 2) makes it more bouncy.
                            let resistanceThreshold: CGFloat = 3.5
                            
                            if totalOffset > menuWidth {
                                let excess = totalOffset - menuWidth
                                let slowedExcess = excess / resistanceThreshold
                                drag = menuWidth + slowedExcess - SidePosition
                            }
                            else if totalOffset < 0 {
                                let excess = abs(totalOffset)
                                let slowedExcess = excess / resistanceThreshold
                                drag = -slowedExcess - SidePosition
                            }
                            else {
                                drag = rawDrag
                            }
                            if (SidePosition == 0 && drag >= 0) || (SidePosition > 0) {
                                xoffset = drag
                            } else {
                                xoffset = 0
                            }
                        }
                        .onEnded { gesture in
                            let finalDrag = xoffset
                            let menuWidth = geometry.size.width / menuWidthRatio
                            let threshold: CGFloat = 100.0
                            withAnimation(.spring(duration: 0.2)) {
                                if SidePosition == 0 && finalDrag > threshold {
                                    SidePosition = menuWidth
                                }
                                else if SidePosition > 0 && finalDrag < -threshold {
                                    SidePosition = 0
                                }
                                else if SidePosition > 0 {
                                    SidePosition = menuWidth
                                } else {
                                    SidePosition = 0
                                }
                                
                                xoffset = 0
                            }
                        })
            }
        }
    }
}

struct SlideOpacityModifier: ViewModifier {
    var xoffset: CGFloat
    var sidePosition: CGFloat
    var isFadingOut: Bool // NEW: A boolean to switch between the two modes
    
    @ViewBuilder
    func body(content: Content) -> some View {
        // Use a GeometryReader to get the full width for normalization
        GeometryReader { geometry in
            
            // Calculate the normalized position (0.0 to 1.0)
            let normalizedPosition = Double(xoffset + sidePosition) / geometry.size.width * 1.5
            
            // Apply the appropriate logic based on the 'isFadingOut' flag
            let opacityValue: Double = isFadingOut ?
            // Mode 1: Fade OUT as position increases (1.0 -> 0.0)
            1.0 - normalizedPosition :
            // Mode 2: Fade IN as position increases (0.0 -> 1.0)
            normalizedPosition
            
            content
                .opacity(
                    // Clamp the calculated value between 0 and 1
                    max(0, min(1, opacityValue))
                )
        }
    }
}

extension View {
    /**
     Applies an opacity change based on horizontal position.
     
     - Parameters:
     - xoffset: The current horizontal drag offset.
     - sidePosition: The base/initial horizontal position.
     - fadeOut: If `true`, opacity goes from 1 to 0 as position increases (Your second snippet). If `false`, opacity goes from 0 to 1 as position increases (Your first snippet).
     */
    func slideOpacity(xoffset: CGFloat, sidePosition: CGFloat, fadeOut: Bool) -> some View {
        self.modifier(
            SlideOpacityModifier(
                xoffset: xoffset,
                sidePosition: sidePosition,
                isFadingOut: fadeOut
            )
        )
    }
}

struct Wave: Shape {
    var frequency: Double
    var amplitude: Double
    var phase: Double

    // This allows SwiftUI to animate the wave's phase
    var animatableData: Double {
        get { phase }
        set { self.phase = newValue }
    }

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.width
        let height = rect.height
        let midHeight = height / 2

        // Start the path at the left edge of the view, centered vertically
        path.move(to: CGPoint(x: 0, y: midHeight))

        // Draw the wave across the view
        // The stride value (e.g., 5) determines the smoothness/performance trade-off
        for x in stride(from: 0, to: width, by: 5) {
            let relativeX = x / width
            // The sine function generates the curve
            let sine = sin(relativeX * frequency + phase)
            // Calculate the y position, adjusted by amplitude
            let y = midHeight + CGFloat(sine) * amplitude
            
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        // 1. Line up from the end of the wave to the top right corner (0 on the y-axis)
        path.addLine(to: CGPoint(x: width, y: 0))

        // 2. Line across the top edge to the top left corner
        path.addLine(to: CGPoint(x: 0, y: 0))

        // 3. Close the subpath (this automatically connects the top-left corner
        //    to the starting point at (0, midHeight))
        path.closeSubpath()

        return path
    }
}


#Preview {
    HomeView()
}
