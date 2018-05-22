//
//  profileController.swift
//  AccountingApp
//
//  Created by tinkon on 2018/5/21.
//  Copyright © 2018年 Henry Lam. All rights reserved.
//

import UIKit

class profileController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var profit = 0


    @IBOutlet weak var imagePicked: UIImageView!
    
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var incomeLabel: UILabel!
    @IBOutlet weak var expenseLabel: UILabel!
    @IBOutlet weak var profitLabel: UILabel!
    
    @IBAction func openCameraButton(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    let picker = UIDatePicker()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        update()
        
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
        
        picker.datePickerMode = .date
    }
    
    @objc func donePressed(){
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: picker.date)
        
        dateField.text = "\(dateString)"
        self.view.endEditing(true)
    }
    
    func update(){
        incomeLabel.text = "\(user.income)"
        expenseLabel.text = "\(user.expense)"
        profit = user.income + user.expense
        profitLabel.text = "\(profit)"
    }
    @IBAction func refreshButton(_ sender: Any) {
        update()
    }
    
    //    @IBAction func dateChange(_ sender: Any) {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = DateFormatter.Style.short
//        let strDate = dateFormatter.string(from: datePicker.date)
//        dateLabel.text = strDate
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
