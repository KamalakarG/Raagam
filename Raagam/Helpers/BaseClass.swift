//
//  BaseClass.swift
//
//

import UIKit

class BaseClass: NSObject {
    
    static let shared = BaseClass()
    
    var appDateFormat = ""
    
    
    func validateEmailWithString(email: String) -> Bool {
      
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
                    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                    let result = emailTest.evaluate(with: email)
                 return result
    }
    
    func isValidPassword(password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,16}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }

    
    func getDateFromTimeinterval(timeInterval : String) -> String {
        let formater = DateFormatter()
        formater.dateFormat = BaseClass.shared.appDateFormat
        let time = TimeInterval(timeInterval)!/1000
        let date = Date(timeIntervalSince1970: time)
        let dateStr = formater.string(from: date as Date)
        return dateStr
    }
    
    func compareTwoDates(toDate: String) -> Bool{
        let formater = DateFormatter()
        formater.dateFormat = BaseClass.shared.appDateFormat
        let toDate1 = formater.date(from: toDate)!
        if toDate1 <= Date() {
            return true
        } else {
            return false
        }
    }
    
    func getDateStrFromFomat(dateStr: String, from: String = BaseClass.shared.appDateFormat, to: String = BaseClass.shared.appDateFormat) -> String {
        let formater = DateFormatter()
        formater.dateFormat = from
        if let date = formater.date(from: dateStr){
            formater.dateFormat = to
            return formater.string(from: date)
        }
        return dateStr
    }
    
    func getTimeintervalFromDateInt64(dateStr : String, formatStr: String = BaseClass.shared.appDateFormat) -> Int64 {
        let formater = DateFormatter()
        formater.dateFormat = formatStr
        let date = formater.date(from: dateStr)
        let timestamp = (date?.timeIntervalSince1970)! * 1000
        let str = String(format: "%.0f", timestamp)
        return Int64(str)!
    }
    
    func calculateDaysBetweenTwoDates(start: String, end: String) -> Int {
//        let formater = DateFormatter()
//        formater.dateFormat = BaseClass.shared.appDateFormat
//        let date1 = formater.date(from: start)
//        let date2 = formater.date(from: end)
//        let currentCalendar = Calendar.current
//        guard let start = currentCalendar.ordinality(of: .day, in: .era, for: date1!) else {
//            return 0
//        }
//        guard let end = currentCalendar.ordinality(of: .day, in: .era, for: date2!) else {
//            return 0
//        }
//
//        return end - start
        
        var datesArray: [Date] =  [Date]()
        let fmt = DateFormatter()
        fmt.dateFormat = BaseClass.shared.appDateFormat
        let date1 = fmt.date(from: start)
        let endDate = fmt.date(from: end)!
        var startDate = date1!
        let calendar = Calendar.current
        
        while startDate <= endDate  {
            datesArray.append(startDate)
            startDate = calendar.date(byAdding: .day, value: 1, to: startDate)!
        }
        datesArray = datesArray.filter{ !calendar.isDateInWeekend($0) }
        return datesArray.count
    }

}

