//
//  NotificationsView.swift
//  ResistanceSideMenu
//
//  Created by Ivan Voznyi on 9/28/25.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Image(systemName: "bell.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 75)
                        .offset(x: 15, y: 15)
                    Spacer()
                }
                .padding(.bottom, 90)
                
                VStack(spacing: 20) {
                    HStack {
                        Image("1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.5))
                                    .stroke(.black, style: StrokeStyle(lineWidth: 1))
                                    .frame(width: 65, height: 65)
                            }
                        VStack(alignment: .leading) {
                            Text("Discord")
                                .textCase(.uppercase)
                            Text("Premium subcription")
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                                
                        }.padding(10)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "link")
                                .frame(width: 50, height: 50)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .foregroundStyle(Color.primary)
                    }
                    .frame(width: geo.size.width / 1.3 , height: 50)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    )
                    HStack {
                        Image("2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.5))
                                    .stroke(.black, style: StrokeStyle(lineWidth: 1))
                                    .frame(width: 65, height: 65)
                            }
                        VStack(alignment: .leading) {
                            Text("Dropbox")
                                .textCase(.uppercase)
                            Text("12 file uploaded")
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                                
                        }.padding(10)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "tray.and.arrow.up.fill")
                                .frame(width: 50, height: 50)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .foregroundStyle(Color.primary)
                    }
                    .frame(width: geo.size.width / 1.3 , height: 50)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    )
                    HStack {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray.opacity(0.5))
                                    .stroke(.black, style: StrokeStyle(lineWidth: 1))
                                    .frame(width: 65, height: 65)
                            }
                        VStack(alignment: .leading) {
                            Text("Email")
                                .textCase(.uppercase)
                            Text("45 unread emails")
                                .font(.caption)
                                .foregroundStyle(Color.secondary)
                                
                        }.padding(10)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "cloud.fill")
                                .frame(width: 50, height: 50)
                                .background(Color.gray.opacity(0.3))
                                .clipShape(Circle())
                        }
                        .foregroundStyle(Color.primary)
                    }
                    .frame(width: geo.size.width / 1.3 , height: 50)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                    )
                }
            }
            .padding(20)
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
    NotificationsView()
}
