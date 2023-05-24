//
//  QuestionView.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 08/05/23.
//

import SwiftUI
import CoreData

struct QuestionView: View {
    @State private var isEditing = false
    @State private var color = Color("Color3")
    @State var i : Int = 0
         
    @State var score = 0.0
    @State var result = "anxiety"
    @State var button = "NEXT"
    @State private var next = false

    @State private var currentValue = 2.0
    @State private var indicator = "moderate"
    @State private var progress = 25.0
    
    @Environment(\.managedObjectContext) private var viewContext
    
    struct GaugeProgressStyle: ProgressViewStyle {
        var strokeColor = Color.blue
        var strokeWidth = 25.0

        func makeBody(configuration: Configuration) -> some View {
            let fractionCompleted = configuration.fractionCompleted ?? 0

            return ZStack {
                Circle()
                    .trim(from: 0, to: fractionCompleted)
                    .stroke(strokeColor, style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
            }
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("ColorBackground").ignoresSafeArea()
                if(self.i < question.count){
                    VStack {
                        Text("\(self.i + 1) / 14")
                            .foregroundColor(Color("ColorText"))
                            .font(.system(size: 14, weight: .medium, design: .default))
                        ProgressBar(progress: progress)
                        Spacer()
                        Image(question[self.i].img!)
                            .padding(.top, 10)
                        VStack(alignment: .leading){
                            Text(question[self.i].title!)
                                .font(.system(size: 28, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("ColorText"))
                                .padding(.horizontal, 20)
                                .padding(.top, 10)
                            Text(question[self.i].question!)
                                .font(.system(size: 22, weight: .regular, design: .default))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("ColorText"))
                                .padding(.horizontal, 20)
                                .padding(.top, 10)
                        }
                        Spacer()
                        VStack() {
                            Text(indicator)
                                .foregroundColor(color)
                                .font(.system(size: 28, weight: .bold, design: .default))
                            Spacer()
                                .frame(height: 10)
                            SliderView2(value: $currentValue)
                                .frame(width:360, height:30)
                                .onChange(of: currentValue){newValue in
                                    withAnimation {
                                        if (currentValue > 3.5){
                                            color = Color("Color5")
                                            indicator = "very severe"
                                        } else if(currentValue > 2.5) {
                                            color = Color("Color4")
                                            indicator = "severe"
                                        } else if (currentValue > 1.5) {
                                            color = Color("Color3")
                                            indicator = "moderate"
                                        } else if (currentValue > 0.5) {
                                            color = Color("Color2")
                                            indicator = "mild"
                                        } else {
                                            color = Color("Color1")
                                            indicator = "not present"
                                        }
                                    }
                                }
                        }
                        Spacer()
                            .frame(height: 25)
                        if self.i == 13 {
                            Button {
                                self.addItem(score: self.score, result: self.result)
                                self.action(n: currentValue)
                            } label: {
                                Text("SEE RESULT")
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .foregroundColor(Color("ColorTextButton"))
                                    .frame(width: 360, height: 40)
                                    .background(Color("ColorButton"))
                                    .cornerRadius(15)
                            }.padding(20)
                            Spacer()
                                .frame(height: 30)
                        } else {
                            Button {
                                self.action(n: currentValue)
                            } label: {
                                Text(button)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .foregroundColor(Color("ColorTextButton"))
                                    .frame(width: 360, height: 40)
                                    .background(Color("ColorButton"))
                                    .cornerRadius(15)
                            }.padding(20)
                            Spacer()
                                .frame(height: 30)
                        }
                    }
                }
                else{
                    FinalView(score : self.score, result: self.result)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    func action( n : Double){
        self.score = self.score + n
        progress = CGFloat(progress + 25)
        if (score > 30){
            result = "Severe anxiety"
        } else if (score > 24) {
            result = "Moderate to severe anxiety"
        } else if (score > 17) {
            result = "Mild to moderate anxiety"
        } else {
            result = "Mild anxiety"
        }
        self.currentValue = 2.0
        self.i = self.i + 1
    }
    func addItem(score: Double, result: String) {
        withAnimation {
            let newItem = Person(context: viewContext)
            newItem.timestamp = Date()
            newItem.score = score
            newItem.result = result

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
        
    }
}
