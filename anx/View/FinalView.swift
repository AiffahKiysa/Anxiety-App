//
//  FinalView.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 09/05/23.
//

import SwiftUI
import Charts

struct FinalView: View {
    var score : Double
    var result : String
    @State private var showModal = false
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("ColorBackground").ignoresSafeArea()
                ScrollView{
                    VStack(alignment: .trailing){
                        VStack(spacing: 20){
                            Text(result)
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .foregroundColor(Color("ColorTextResult"))
                            VStack(alignment: .leading){
                                VStack(alignment: .center){
                                    Chart([
                                        DataRates(name: "Score", value: score)
                                    ]) { values in
                                        BarMark(
                                            x: .value("name", values.name),
                                            y: .value("value", values.value),
                                            width: 30
                                        )
                                        .foregroundStyle(.linearGradient(colors: [.blue, .cyan], startPoint: .bottom, endPoint: .trailing))
                                        .cornerRadius(10.0)
                                        .annotation(position: .overlay, alignment: .top, spacing: 15.0) {
                                            Text("\(values.value)")
                                                .font(.caption2)
                                                .foregroundColor(Color("ColorText"))
                                                .fontWeight(.bold)
                                                .padding(2)
                                        }
                                        RuleMark(y: .value("score", score))
                                            .foregroundStyle(Color("Color1"))
                                            .annotation(position: .overlay,
                                                        alignment: .bottomTrailing) {
                                                Text("\(String(format: "%.0f", score))")
                                                    .foregroundColor(Color("Color1"))
                                                    .font(.system(size: 15, weight: .bold, design: .default))
                                            }
                                    }.frame(height: 300)
                                        .chartYAxis {
                                            AxisMarks(position: .leading, values: [0, 17, 24, 30, 56]) { _ in
                                                AxisGridLine()
                                                    .foregroundStyle(Color("ColorText"))
                                                AxisValueLabel()
                                                    .foregroundStyle(Color("ColorText"))
                                            }
                                        }
                                }
                                Text("The Hamilton Anxiety Rating Scale limit for people with normal anxiety is 17")
                                    .foregroundColor(Color("ColorText"))
                                    .font(.system(size: 12, weight: .regular, design: .default))
                                    .padding(.top, 10)
                            }.padding(20)
                            .background(Color("ColorCard"))
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading){
                                Text("Anxiety disorders are generally treated with psychotherapy, medication, or both. There are many ways to treat anxiety, and you should work with a health care provider to choose the best treatment for you.")
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                    .foregroundColor(Color("ColorText"))
                            }
                            NavigationLink(destination: PreviousResultView()) {
                                Text("SEE PREVIOUS RESULT")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .foregroundColor(Color("ColorTextButton"))
                                    .frame(width: 360, height: 40)
                                    .background(Color("ColorButton"))
                                    .cornerRadius(15)
                            }
                            Button("Learn more about anxiety"){
                                showModal = true
                            }
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(Color("ColorTextResult"))
                            .padding(.horizontal, 20)
                            .sheet(isPresented: $showModal) {
                                ModalView()
                            }
                            Spacer()
                        }
                    }
                }.padding(20)
            }
        }
        .navigationTitle("Result")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar{
            NavigationLink(destination: OnboardingView(pageIndex: 2)){
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color("ColorButton"))
            }.padding(.horizontal, 20)
        }
    }
}


struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView(score: 20, result: "Anxiety")
    }
}
