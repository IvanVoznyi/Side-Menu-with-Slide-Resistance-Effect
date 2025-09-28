//
//  ProfileView.swift
//  ResistanceSideMenu
//
//  Created by Ivan Voznyi on 9/28/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .offset(x: 15, y: 15)
                    Spacer()
                }
                .padding(.bottom, 50)
                
                VStack(alignment: .leading) {
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 120)
                            .foregroundStyle(Color.gray.opacity(0.4))
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 120)
                            .foregroundStyle(Color.gray.opacity(0.4))

                    }
                    HStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 120)
                            .foregroundStyle(Color.gray.opacity(0.4))

                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 120)
                            .foregroundStyle(Color.gray.opacity(0.4))
                    }
                    
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color.gray.opacity(0.4))
                        .frame(height: .infinity)
                }
                .padding(35)
                .frame(width: .infinity, height: .infinity)
                .background(
                    UnevenRoundedRectangle(cornerRadii: .init(topLeading: 50, topTrailing: 50))
                        .fill(Color.black.opacity(0.2))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                )
                .ignoresSafeArea(edges: .bottom)
            }
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
        ProfileView()
}
