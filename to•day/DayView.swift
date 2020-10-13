//
//  DayView.swift
//  to-day
//
//  Created by Garrison Blair on 2020-10-05.
//

import SwiftUI

struct DayView: View {
    let date: Date
    var itemsRequest: FetchRequest<ToDoItem>
    var items: FetchedResults<ToDoItem> {
        itemsRequest.wrappedValue
    }
    
    init(date: Date) {
        self.date = date
        
        let startDate = NSCalendar.current.startOfDay(for: date)
        // get the start of the day after the selected date
        let endDate = NSCalendar.current.date(byAdding: .day, value: 1, to: NSCalendar.current.startOfDay(for: date))
        
        let predicate = NSPredicate(format: "date >= %@ AND date < %@", startDate as CVarArg, endDate! as CVarArg)
        
        self.itemsRequest = FetchRequest(
            entity: ToDoItem.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \ToDoItem.position, ascending: true)],
            predicate: predicate
        )
    }
    
    var body: some View {
        VStack {
            ForEach(items) { (item: ToDoItem) in
                Text(item.name!)
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(date: Date())
    }
}
