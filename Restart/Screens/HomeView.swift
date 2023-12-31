//
//  HomeView.swift
//  Restart
//
//  Created by Jonas Narbutas on 2023-12-10.
//

import SwiftUI

struct HomeView: View {
//    MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimated : Bool = false
    
//    MARK: - BODY
    var body: some View {
        VStack(spacing: 20) {
            
            // MARK: HEADER
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .green, ShapeOpacity: 0.2)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
                .offset(y: isAnimated ? 35 : -35)
                .animation(
                    Animation
                        .easeInOut(duration: 4)
                        .repeatForever(),
                    value: isAnimated
                )
            }

            
            // MARK: CENTER
            
            Text("Some smart quete")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            
            // MARK: FOOTER
            Spacer()
            
            
            
            Button(action: {
                withAnimation{
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            }){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute:{
                isAnimated = true
            })
        })

    }
    

}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
