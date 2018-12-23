//
//  DateFormatters.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import Foundation

public enum DateFormatters { }

extension DateFormatters {
    
    public enum Format: String {
        case iso8601UTC
        case iso8601LocalTime
        case yyyyMMddHHmmss
        case yyyyMMdd
        case ddMMyyyy
        case yyMMddTHHmmssSSSZ
    }
    
    public static func dateFormatter(withFormat format: Format) -> DateFormatter {
        
        let formatter = DateFormatter()
        
        switch format {
        case .iso8601UTC, .iso8601LocalTime:
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            formatter.calendar = Calendar(identifier: .iso8601)
            formatter.locale = Locale(identifier: "en_US_POSIX")
        case .yyyyMMddHHmmss:
            formatter.dateFormat = "yyyyMMddHHmmss"
        case .yyyyMMdd:
            formatter.dateFormat = "yyyyMMdd"
        case .ddMMyyyy:
            formatter.dateFormat = "ddMMyyyy"
        case .yyMMddTHHmmssSSSZ:
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss-SSS'Z'"
        }
        
        return formatter
        
    }
    
}

extension DateFormatters {
    
    public enum DisplayFormat {
        case day
        case dateAndTime
        case shortDayMonth
        case longDayAndMonth
        case shortDayMonthYear
        case weekdayAndDayMonthYear
    }
    
    public static func dateFormatter(withDisplayFormat format: DisplayFormat) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.timeZone = TimeZone.current
        switch format {
            
        case .day:
            formatter.dateFormat = "dd"
        case .dateAndTime:
            formatter.dateFormat = "dd'/'MM'/'yyyy' as 'HH'h'mm"
        case .shortDayMonth:
            formatter.dateFormat = "dd/MM"
        case .longDayAndMonth:
            formatter.dateFormat = "dd' de 'MMMM"
        case .shortDayMonthYear:
            formatter.dateFormat = "dd/MM/yyyy"
        case .weekdayAndDayMonthYear:
            formatter.dateFormat = "eee', 'dd' de 'MMMM', 'yyyy"
        }
        return formatter
    }
    
}

extension Date {
    
    public func formatted(as format: DateFormatters.DisplayFormat) -> String {
        return DateFormatters.dateFormatter(withDisplayFormat: format).string(from: self)
    }
    
}

