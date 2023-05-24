//
//  PreviousResultView.swift
//  Anx
//
//  Created by Aiffah Kiysa Waafi on 14/05/23.
//

import SwiftUI
import CoreData

struct PreviousResultView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Person.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Person>

    var body: some View {
        NavigationView {
            ZStack{
                Color("ColorBackground").ignoresSafeArea()
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: FinalView(score: item.score, result: item.result!)) {
                            VStack(alignment: .leading){
                                Text("\(item.timestamp!, formatter: itemFormatter)")
                                    .font(.system(size: 18, weight: .medium, design: .default))
                                    .foregroundColor(Color("ColorText"))
                                Text(item.result!)
                                    .font(.system(size: 16, weight: .regular, design: .default))
                                    .foregroundColor(Color("ColorText"))
                                
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                .scrollContentBackground(.hidden)
            }
        }
        .navigationTitle("Your Previous Result")
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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

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

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()

struct PreviousResultView_Previews: PreviewProvider {
    static var previews: some View {
        PreviousResultView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

