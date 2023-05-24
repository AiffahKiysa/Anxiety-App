//
//  CompletedView.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 10/05/23.
//

import SwiftUI
import CoreData

struct CompletedView: View {
    var score : Double
    var result : String
    @State private var animation = 1.0
    
    @State private var navigateToDetailView = false
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            ZStack{
                Color("ColorBackground").ignoresSafeArea()
                VStack(spacing: 100){
                    Text("The test has been completed")
                        .foregroundColor(Color("ColorText"))
                        .font(.system(size: 24, weight: .bold, design: .default))
                    Image("ImageCompleted3")
                        .resizable()
                        .frame(width: 250, height: 200, alignment: .center)
                        .clipped()
                        .scaleEffect(animation+0.2)
                        .animation(
                            .easeInOut(duration: 1.5)
                                .repeatForever(autoreverses: true),
                            value: animation)
                        .onAppear{
                            animation += 0.5
                        }
                    Button(action: {
                        self.addItem(score: self.score, result: self.result)
                        navigateToDetailView = true
                    }) {
                        Text("SEE RESULT")
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(Color("ColorTextButton"))
                            .frame(width: 350, height: 40)
                            .background(Color("ColorButton"))
                            .cornerRadius(10)
                    }.padding(20)
                        .navigationDestination(
                            isPresented: $navigateToDetailView) {
                                FinalView(score: self.score, result: self.result)
                            }
                }
            }
        }
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

struct CompletedView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedView(score: 1, result: "anxiety")
    }
}
