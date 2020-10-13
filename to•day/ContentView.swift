//
//  ContentView.swift
//  to-day
//
//  Created by Garrison Blair on 2020-10-05.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.date, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<ToDoItem>

    var body: some View {
        VStack {
            Button(action: {
                addItem(name: "Conference call with entire team", position: 0)
            }, label: {
                Text("Add")
            })
            Text("Today")
            DayView(date: Date())
        }
    }

    private func addItem(name: String, position: Int16, date: Date = Date()) {
        withAnimation {
            let newItem = ToDoItem(context: viewContext)
            newItem.id = UUID()
            newItem.name = name
            newItem.icon = "📞"
            newItem.position = position
            newItem.date = date

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

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
