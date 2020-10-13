//
//  ToDoItemRow.swift
//  to•day
//
//  Created by Garrison Blair on 2020-10-13.
//

import SwiftUI

struct ToDoItemRow: View {
    var item: ToDoItem
    
    var body: some View {
        HStack {
            Image(uiImage: (item.icon?.image()!)!)
//            Text(item.icon!)
            Text(item.name!)
        }.padding()
    }
}

import UIKit

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

struct ToDoItemRow_Previews: PreviewProvider {    
    static var previews: some View {
        ToDoItemRow(item: getItem())
    }
}
