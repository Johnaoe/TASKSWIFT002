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
    
//    MARK: - BODY
    var body: some View {
        VStack (spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingViewActive = true
            }){
                Text("Restart")
            }
        }
    }

}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
