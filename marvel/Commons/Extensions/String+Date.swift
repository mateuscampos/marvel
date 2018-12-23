//
//  String+Date.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

extension String {
    
    func dayMonthYearFromStringDate() -> String {
        
        if let date = dateFomString(str: self) {
            return DateFormatters.dateFormatter(withDisplayFormat: .shortDayMonthYear).string(from: date)
        }
        
        return self
        
    }
    
    private func dateFomString(str: String) -> Date? {
        
        if let dateObj = DateFormatters.dateFormatter(withFormat: .yyMMddTHHmmssSSSZ).date(from: str) {
            return dateObj
        }
        
        return nil
        
    }
    
}
