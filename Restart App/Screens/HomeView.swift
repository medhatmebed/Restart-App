//
//  HomeView.swift
//  Restart App
//
//  Created by Medhat Mebed on 12/21/23.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating = false
    var body: some View {
            VStack(spacing: 20) {
               
                //MARK: - HEADER
                Spacer()
                ZStack {
                    CircleGroupView(shapeColor: Color("ColorBlue"), shapeOpacity: 0.2)
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            Animation
                                .easeInOut(duration: 4)
                                .repeatForever(),
                            value: isAnimating
                            
                        )
                }
               
                //MARK: - CENTER
              
                Text("the time that leads to mastery is dependent on the intensity of our focus")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                //MARK: - FOOTER
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        playSound(sound: "success", type: "m4a")
                        isOnboardingViewActive = true
                    }
                }) {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    isAnimating = true
                })
            })
    }
}

#Preview {
    HomeView()
}
