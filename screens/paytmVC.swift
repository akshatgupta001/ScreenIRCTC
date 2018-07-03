//
//  paytmVC.swift
//  screens
//
//  Created by Akshat Gupta on 28/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit

class paytmVC: UIViewController {
    @IBOutlet weak var contentView: UIView!
   
    @IBOutlet weak var NetBankingView: UIView!
    @IBOutlet weak var cardImg: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var cardPayment: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(creditTap))
        cardView.addGestureRecognizer(tap)
         NetBankingView.frame = CGRect(x: 8, y: 210, width: view.frame.width - 16, height: 100)
        
        setNavBar()
      
    }
    func dragNetbankDown(){
        NetBankingView.frame = CGRect(x: 8, y: 440, width: view.frame.width-16, height: 100)
        NetBankingView.isHidden = false;
    }
  
   @objc func creditTap(){
    if cardImg.image == #imageLiteral(resourceName: "ic_radiooff"){
       
        dragNetbankDown()

        cardPayment.isHidden = false
        cardImg.image = #imageLiteral(resourceName: "ic_radio_on")
       
    }else{
        cardPayment.isHidden = true
        cardImg.image = #imageLiteral(resourceName: "ic_radiooff")
         NetBankingView.frame = CGRect(x: 8, y: 210, width: view.frame.width-16, height: 100)
        
    }
    
    }
    func setNavBar(){
        
       //self.navigationController?.navigationBar.barTintColor = UIColor.gray
        let header = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        header.text = "Payment Screen"
        header.font = UIFont(name: "Avenir Next", size: 20)
        header.sizeToFit()
        header.textAlignment = NSTextAlignment.center
        self.navigationItem.titleView = header
    }
    
    
    
    deinit {
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0/255.0, green: 150/255.0, blue: 177/255.0, alpha: 1)

    }
    
    

}
