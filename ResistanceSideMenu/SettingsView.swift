//
//  Settings.swift
//  ResistanceSideMenu
//
//  Created by Ivan Voznyi on 9/28/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                    Spacer()
                }
                .padding(.bottom, 90)
                
                VStack {
                    HStack {
                        Image(systemName: "wifi")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .fill(.gray.opacity(0.2))
                                    .frame(width: 50, height: 50)
                            )
                            .padding(.trailing, 10)
                        VStack(alignment: .leading) {
                            Text("Network & Internet")
                                .font(.title2)
                            Text("Mobile, Wi-Fi, Hotspot")
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.right")
                                .background(
                                    Circle()
                                        .fill(.gray.opacity(0.1))
                                        .frame(width: 50, height: 50)
                                )
                        }
                        .foregroundStyle(.primary)
                        .padding(.trailing, 5)
                    }
                    .padding([.horizontal], 20)
                    .padding([.vertical], 10)
                }
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, topTrailing: 20))
                        .fill(Color.gray.opacity(0.5))
                )
                .padding(.bottom, -6)
                
                VStack {
                    HStack {
                        Image(systemName: "desktopcomputer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .fill(.gray.opacity(0.2))
                                    .frame(width: 50, height: 50)
                            )
                            .padding(.trailing, 10)
                        VStack(alignment: .leading) {
                            Text("Connected Devices")
                                .font(.title2)
                            Text("Bluettoth, Pairing")
                        }
                        Spacer()
                        Button {
                        } label: {
                            Image(systemName: "chevron.right")
                                .background(
                                    Circle()
                                        .fill(.gray.opacity(0.1))
                                        .frame(width: 50, height: 50)
                                )
                        }
                        .foregroundStyle(.primary)
                        .padding(.trailing, 5)
                    }
                    .padding([.horizontal], 20)
                    .padding([.vertical], 10)
                }
                .background(
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                )
                .padding(.bottom, -6)
                
                VStack {
                    HStack {
                        Image(systemName: "app.background.dotted")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .fill(.gray.opacity(0.2))
                                    .frame(width: 50, height: 50)
                            )
                            .padding(.trailing, 10)
                        VStack(alignment: .leading) {
                            Text("Apps")
                                .font(.title2)
                            Text("Assistant, Recent apps, Default")
                        }
                        Spacer()
                        Button {
                        } label: {
                            Image(systemName: "chevron.right")
                                .background(
                                    Circle()
                                        .fill(.gray.opacity(0.1))
                                        .frame(width: 50, height: 50)
                                )
                        }
                        .foregroundStyle(.primary)
                        .padding(.trailing, 5)
                    }
                    .padding([.horizontal], 20)
                    .padding([.vertical], 10)
                }
                .background(
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                )
                .padding(.bottom, -6)

                VStack {
                    HStack {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .fill(.gray.opacity(0.2))
                                    .frame(width: 50, height: 50)
                            )
                            .padding(.trailing, 10)
                        VStack(alignment: .leading) {
                            Text("Notifications")
                                .font(.title2)
                            Text("Notifications history, Conversat")
                        }
                        Spacer()
                        Button {
                        } label: {
                            Image(systemName: "chevron.right")
                                .background(
                                    Circle()
                                        .fill(.gray.opacity(0.1))
                                        .frame(width: 50, height: 50)
                                )
                        }
                        .foregroundStyle(.primary)
                        .padding(.trailing, 5)
                    }
                    .padding([.horizontal], 20)
                    .padding([.vertical], 10)
                }
                .background(
                    Rectangle()
                        .fill(.gray.opacity(0.5))
                )
                .padding(.bottom, -6)

                
                VStack {
                    HStack {
                        Image(systemName: "battery.100percent")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .background(
                                Circle()
                                    .fill(.gray.opacity(0.2))
                                    .frame(width: 50, height: 50)
                            )
                            .padding(.trailing, 10)
                        VStack(alignment: .leading) {
                            Text("Battery")
                                .font(.title2)
                            Text("100% - Full Charged")
                        }
                        Spacer()
                        Button {
                        } label: {
                            Image(systemName: "chevron.right")
                                .background(
                                    Circle()
                                        .fill(.gray.opacity(0.1))
                                        .frame(width: 50, height: 50)
                                )
                        }
                        .foregroundStyle(.primary)
                        .padding(.trailing, 5)
                    }
                    .padding([.horizontal], 20)
                    .padding([.vertical], 10)
                }
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 20, bottomTrailing: 20))
                        .fill(Color.gray.opacity(0.5))
                )
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(
                Wave(frequency: 10, amplitude: 95, phase: 4.5)
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: geo.size.width * 2, height: 360)
                    .position(x: geo.size.width / 2, y: geo.safeAreaInsets.top + 40)
                    .ignoresSafeArea()
            )
            .contentShape(Rectangle())
        }
    }
}

#Preview {
    SettingsView()
}
