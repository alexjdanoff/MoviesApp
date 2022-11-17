//
//  String+Extension.swift
//  Movies
//
//  Created by Alexandru Jdanov on 02.11.2022.
//

import Foundation

extension String {
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: self) ?? Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year], from: date)
        let year = components.year
            
        return year?.description ?? ""
    }
}
