//
//  ContentView.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 08/05/23.
//

import SwiftUI

struct ContentView: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    // Customise your SplashScreen here
    var body: some View {
        if isActive {
            OnboardingView(pageIndex: 0)
        } else {
            ZStack {
                Color("ColorBackground").ignoresSafeArea()
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                    
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
