//
//  paytmVC.swift
//  screens
//
//  Created by Akshat Gupta on 28/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit
class paytmVC: UIViewController {
    let separatorWidth : CGFloat = 6
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
    
    
    var datePicker : UIDatePicker?
    
    @IBOutlet weak var NetBankingImg: UIImageView!
    @IBOutlet weak var cardImg: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var TicketView: UIView!
    
    @IBOutlet weak var PaytmWalletView: UIView!
    @IBOutlet weak var bankButton: UIButton!
    @IBOutlet weak var cardPayment: UIView!
    
    @IBOutlet weak var BankView: UIView!
    @IBOutlet weak var BankLabel: UILabel!
    
    @IBAction func proceedToPay(_ sender: Any) {
        print(CardNumber.text ?? "card")
        print(expiryDate.text ?? "expiry date")
    }
    @IBAction func expiryDateDidChange(_ sender: Any) {
        guard let str : String = expiryDate?.text! else {return}
        if (str.count == 2 && !str.contains("/")){
            
            expiryDate.text?.append("/")
        }else if( str.count < 2 && str.contains("/")) {
          expiryDate?.text?.removeAll()
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        NetBankingView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height + 3*separatorWidth, width: view.frame.width , height: 60)
        BankView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height + 3*separatorWidth + NetBankingView.frame.height, width: view.frame.width, height: 65)
        let cn : String = bankNameShared.shared.bankName ?? "Select Company"
        bankButton.setTitle(cn, for: .normal)
       
        


    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setNavBar()
        
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(creditTap))
        cardView.addGestureRecognizer(tap)
       
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(BankSelect))
        BankView.addGestureRecognizer(tap3)
        payBtn.layer.cornerRadius = payBtn.frame.height/2
        payBtn.clipsToBounds = true
        
      
    }
    
   
    
    func dragDown(){
        BankView.isHidden = true
        NetBankingView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height+cardPayment.frame.height + 3*separatorWidth, width: view.frame.width, height: 60)
        BankView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height+cardPayment.frame.height + 60 + 3*separatorWidth, width: view.frame.width, height: 65)
        PaytmWalletView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height+cardPayment.frame.height + NetBankingView.frame.height + 4*separatorWidth , width: view.frame.width, height: 65)
    }
    func dragUp(){
        //TicketView.frame.height + cardView.frame.height+24 =210
        NetBankingView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height + 3*separatorWidth, width: view.frame.width, height: 60)
        BankView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height+60 + 3*separatorWidth + 60, width: view.frame.width, height: 65)
        PaytmWalletView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height + NetBankingView.frame.height + 4*separatorWidth , width: view.frame.width, height: 65)
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
         PaytmWalletView.frame = CGRect(x: 0, y: TicketView.frame.height + cardView.frame.height + BankView.frame.height + NetBankingView.frame.height + 4*separatorWidth , width: view.frame.width, height: 65)

        
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
