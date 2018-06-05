//
//  addController.swift
//  AccountingApp
//
//  Created by tinkon on 2018/5/21.
//  Copyright © 2018年 Henry Lam. All rights reserved.
//

import UIKit

var allBill = [bill]

class addController: UIViewController {

        let picker = UIDatePicker()
    
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var moneyText: UITextField!
    @IBOutlet weak var purposeText: UITextField!
    @IBOutlet weak var addBill: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        dateField.inputAccessoryView = toolbar
        dateField.inputView = picker
        picker.datePickerMode = .dateAndTime
    }
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year: String = dateFormatter.string(from: self.picker.date)
        bill.year = year
        dateFormatter.dateFormat = "MM"
        let month: String = dateFormatter.string(from: self.picker.date)
        bill.month = month
        dateFormatter.dateFormat = "dd"
        let day: String = dateFormatter.string(from: self.picker.date)
        bill.day = day
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        let dateString = dateFormatter.string(from: picker.date)
        
        dateField.text = "\(dateString)"
        
        self.view.endEditing(true)
    }
    @IBAction func addButton(_ sender: Any) {
        if purposeText.text! != ""{
            bill.purpose = purposeText.text!
        }else{
            bill.purpose = "Unknown reason"
        }
        if moneyText.text != ""{
            bill.money = Int(moneyText.text!)!
            if Int(moneyText.text!)! >= 0{
                user.income = user.income + Int(moneyText.text!)!
            }else if Int(moneyText.text!)! <= 0{
                user.expense = user.expense + Int(moneyText.text!)!
            }
        }
        allBill.append(bill)
        purposeText.text = ""
        moneyText.text = ""
        
        print(bill.month)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
