//
//  DatePicker+UIViewController.swift
//


import UIKit

extension UIViewController {
    
    func datePicker(title : String, minDate : String, maxDate : String, sender : UIButton, completionHandler : @escaping (_ dateStr : String) -> Void) {
        
        var preferredStyle : UIAlertController.Style = .actionSheet
        if DeviceType.IS_IPAD {
            preferredStyle = .actionSheet
        }
        
        let formater = DateFormatter()
        formater.dateFormat = BaseClass.shared.appDateFormat
        //create alert controller
        let alertController = UIAlertController(title: title, message: "\n\n\n\n\n\n\n\n\n\n", preferredStyle: preferredStyle)
        var xValue = 0
        if DeviceType.IS_IPAD{
            xValue = -225
        }
        //frame for custom view
        let pickerFrame = CGRect(x: 0, y: 50, width: self.view.frame.size.width, height: 200)
        //frame for picker view
        let pickerFrame1 = CGRect(x: xValue, y: 0, width: Int(self.view.frame.size.width), height: 200)
        //add date picker
        let datePickerView = UIView(frame: pickerFrame)
        datePickerView.backgroundColor = UIColor.clear
        let picker = UIDatePicker(frame: pickerFrame1)
        picker.datePickerMode = .date
        //min date for picker
        if !minDate.isEmpty {
            let minimuDate = formater.date(from: minDate)
            picker.minimumDate = minimuDate
        }
        //Max date for picker
        if !maxDate.isEmpty {
            let maximumDate = formater.date(from: maxDate)
            picker.maximumDate = maximumDate
        }
        datePickerView.addSubview(picker)
        alertController.view.addSubview(datePickerView)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            let dateStr = formater.string(from: picker.date)
            completionHandler(dateStr)
        }
        alertController.addAction(okAction)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        alertController.addAction(cancel)
        if DeviceType.IS_IPAD {
            if let currentPopoverpresentioncontroller = alertController.popoverPresentationController{
                currentPopoverpresentioncontroller.sourceView = self.view
                popoverPresentationController?.sourceRect = sender.frame
                currentPopoverpresentioncontroller.permittedArrowDirections = .any;
                self.present(alertController, animated: true, completion: nil)
            }
        }else{
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
