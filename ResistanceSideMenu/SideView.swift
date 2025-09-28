//
//  SideView.swift
//  ResistanceSideMenu
//
//  Created by Ivan Voznyi on 9/28/25.
//

import SwiftUI

struct SideView: View {
    @Binding var path: NavigationPath
    var Close: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    Text("Search")
                        .foregroundStyle(.gray)
                    Spacer()
                }
                .frame(height: 40)
                .padding(.horizontal)
                .background(.gray.opacity(0.2), in: .capsule)
                
                Button {
                    withAnimation(.spring(duration: 0.2)) {
                        Close()
                    }
                } label: {
                    Image(systemName: "xmark")
                        .frame(width: 40, height: 40)
                        .background(.gray.opacity(0.2), in: .circle)
                }
                .tint(.primary)
            }
            
            
            VStack(alignment: .leading, spacing: 24) {

                Button {
                    path.append(AppView.profile)
                } label: {
                    Text("Profile")
                }
                Button {
                    path.append(AppView.notifications)
                } label: {
                    Text("Notifications")
                }
                Button {
                    path.append(AppView.settings)
                } label: {
                    Text("Settings")
                }
            }
            .tint(.primary)
            
            Spacer()
            HStack  {
                HStack(spacing: 0) {
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.white.opacity(0.2))
                        .overlay(Image(systemName: "cube"))
                    Text("sucodee")
                }
                Spacer()
                Image(systemName: "gear")
            }
            .padding()
        }
        .contentShape(Rectangle())
        .padding(.top, 32)
        .padding(.horizontal)
    }
}

struct ConversationItem: View {
    var title: String
    var date: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .foregroundStyle(.white)
                .font(.body)
            Text(date)
                .foregroundStyle(.gray)
                .font(.caption)
        }
    }
}

#Preview {
    SideView(path: .constant(NavigationPath()), Close: {})
}
