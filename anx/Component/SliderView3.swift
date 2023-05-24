//
//  UISliderView.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 09/05/23.
//

import SwiftUI

struct SliderView3: View {
    @Binding var value: Double
    
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 0...4
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.height * 0.8
            let minValue = gr.size.width * 0.015
            let maxValue = (gr.size.width * 0.98) - thumbSize
            
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue
            
            ZStack {
                HStack{
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Color1")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 10)
                        .cornerRadius(10)
                    Spacer()
                        .frame(width: 4)
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Color2")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 10)
                        .cornerRadius(10)
                    Spacer()
                        .frame(width: 4)
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Color3")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 10)
                        .cornerRadius(10)
                    Spacer()
                        .frame(width: 4)
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Color4")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 10)
                        .cornerRadius(10)
                    Spacer()
                        .frame(width: 4)
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color("Color5")]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: 60, height: 10)
                        .cornerRadius(10)
                }
                HStack {
                    Circle()
                        .foregroundColor(Color("ColorText"))
                        .shadow(radius: 4)
                        .frame(width: thumbSize, height: thumbSize)
                        .offset(x: sliderVal)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                                    
                                }
                        )
                    Spacer()
                }
            }
        }
    }
}
