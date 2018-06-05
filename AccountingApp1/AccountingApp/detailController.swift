//
//  detailController.swift
//  AccountingApp
//
//  Created by tinkon on 2018/5/21.
//  Copyright © 2018年 Henry Lam. All rights reserved.
//

import UIKit

class detailController: UIViewController {
    
    var i = 0
    var makeBill = 0
    
    var allLabels = [UILabel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        for _ in 1...allBill.count{
            createLabel(i: makeBill)
            makeBill += 1
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLabel(i: Int){
        let labelPurpose = UILabel(frame: CGRect(x: Int(self.view.frame.width / 4), y:Int(150 + 25 * i), width: 100, height: 21))
        labelPurpose.center = CGPoint(x: Int(self.view.frame.width / 4), y:Int(150 + 25 * i))
        labelPurpose.textAlignment = .center
        labelPurpose.text = "\(allBill[i].purpose)"
        self.view.addSubview(labelPurpose)
        allLabels.append(labelPurpose)
        
        let labelMoney = UILabel(frame: CGRect(x: Int(self.view.frame.width / 4 * 3), y:Int(150 + 25 * i), width: 100, height: 21))
        labelMoney.center = CGPoint(x: Int(self.view.frame.width / 4 * 3), y:Int(150 + 25 * i))
        labelMoney.textAlignment = .center
        labelMoney.text = "\(allBill[i].money)"
        self.view.addSubview(labelMoney)
        allLabels.append(labelMoney)
    }
    
    func buildView(){
        let label1 = UILabel(frame: CGRect(x: self.view.frame.width / 4, y:100 , width: 100, height: 21))//make location
        label1.center = CGPoint(x: self.view.frame.width / 4, y:100)
        label1.textAlignment = .center
        label1.text = "Purpose"
        self.view.addSubview(label1)
        allLabels.append(label1)
        
        let label2 = UILabel(frame: CGRect(x: self.view.frame.width / 4 * 3, y:100 , width: 100, height: 21))
        label2.center = CGPoint(x: self.view.frame.width / 4 * 3, y:100)
        label2.textAlignment = .center
        label2.text = "Money"
        self.view.addSubview(label2)
        allLabels.append(label2)
    }
    
    func removeAllLabels(){
        for i in allLabels{ //put all labels into this array so can remove them easier
            i.removeFromSuperview()
        }
    }
    
    @IBAction func refreshButton(_ sender: Any) {
        makeBill = 0
        removeAllLabels()
            buildView()
        if allBill.count == 1{
            createLabel(i: 0)
        }else if allBill.count == 0{
            print("?")
        }else{
            for _ in 0...allBill.count-1{
                createLabel(i: makeBill)
                makeBill += 1
            }
        makeBill = 0
        }
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
