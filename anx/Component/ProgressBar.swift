//
//  ProgressBar.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 10/05/23.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .frame(maxWidth: 350, maxHeight: 10)
                .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
                .cornerRadius(10)
            
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color("Color1")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: progress, height: 10)
                .cornerRadius(10)
         

        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(progress: 10)
    }
}
