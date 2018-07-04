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
    
    @IBAction func NetBankpressed(_ sender: Any) {
        NetBankingTap()
    }
    // card details
    @IBOutlet weak var CardNumber: UITextField!
    @IBOutlet weak var expiryDate: UITextField!
    @IBOutlet weak var CVV: UITextField!
    
    @IBOutlet weak var payBtn: UIButton!
    
    
    @IBOutlet weak var NetBankingImg: UIImageView!
    @IBOutlet weak var cardImg: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var bankButton: UIButton!
    @IBOutlet weak var cardPayment: UIView!
    
    @IBOutlet weak var BankView: UIView!
    @IBOutlet weak var BankLabel: UILabel!
    
    @IBAction func proceedToPay(_ sender: Any) {
        print(CardNumber.text ?? "card")
        print(expiryDate.text ?? "expiry date")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        NetBankingView.frame = CGRect(x: 0, y: 210, width: view.frame.width , height: 60)
        BankView.frame = CGRect(x: 0, y: 271, width: view.frame.width, height: 65)
        let cn : String = bankNameShared.shared.bankName ?? "Select Company"
        bankButton.setTitle(cn, for: .normal)
       
        


    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setNavBar()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(creditTap))
        cardView.addGestureRecognizer(tap)
//        let tap2 = UITapGestureRecognizer(target: self, action: #selector(NetBankingTap))
//        NetBankingView.addGestureRecognizer(tap2)
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(BankSelect))
        BankView.addGestureRecognizer(tap3)
        payBtn.layer.cornerRadius = payBtn.frame.height/2
        payBtn.clipsToBounds = true
        
      
    }
    func dragDown(){
        NetBankingView.frame = CGRect(x: 0, y: 430, width: view.frame.width, height: 60)
        BankView.frame = CGRect(x: 0, y: 491, width: view.frame.width, height: 65)
    }
    func dragUp(){
        NetBankingView.frame = CGRect(x: 0, y: 210, width: view.frame.width, height: 60)
        BankView.frame = CGRect(x: 0, y: 271, width: view.frame.width, height: 65)
    }
  
    @objc func BankSelect(){
        
    }
   @objc func creditTap(){
       if cardImg.image == #imageLiteral(resourceName: "dismiss_music") {
        dragDown()
        cardPayment.isHidden = false
        cardImg.image = #imageLiteral(resourceName: "ic_radio_on")
       
       }else{
        cardPayment.isHidden = true
        cardImg.image = #imageLiteral(resourceName: "dismiss_music")
        dragUp()
        
       }
    }
    
    @objc func NetBankingTap(){
        
        
            BankView.isHidden = false
        cardPayment.isHidden = true

        
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
