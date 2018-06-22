//
//  secondVC.swift
//  screens
//
//  Created by Akshat Gupta on 13/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit

class secondVC: SubView {

    @IBOutlet weak var scrollView: UIScrollView!
    let epopView = UIView()
    
    let othersView = UIView()
    var bankDetailDtos = [BankDetailDTO]()
     var walletArray = [setLabel]()
    
    @IBOutlet weak var eWalletBtn: UIButton!
    @IBOutlet weak var eWalletView: UIView!
    
    @IBOutlet weak var otherView: UIView!
    
    @IBAction func OthersBtnPressed(_ sender: Any) {
        
    }
    
//
//    @IBAction func othersPressed(_ sender: Any) {
//        if othersBtn.image(for: .normal) == #imageLiteral(resourceName: "ic_radio_yellow_off") {
//            othersBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_on"), for: .normal)
//            addOthersView()
//        }else {
//            othersBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_off"), for: .normal)
//            epopView.removeFromSuperview()
//        }
//    }
    
    @IBOutlet weak var PayBtn: UIButton!
    
    
    @IBAction func eWalletPressed(_ sender: Any) {
        
        if eWalletBtn.image(for: .normal) == #imageLiteral(resourceName: "ic_radio_yellow_off") {
            eWalletBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_on"), for: .normal)
            epopView.isHidden = false
             othersView.frame = CGRect(x: 0, y: 90 + epopView.frame.height, width: self.view.frame.height, height: 90)
        }else {
            eWalletBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_off"), for: .normal)
            epopView.isHidden = true
             othersView.frame = CGRect(x: 0, y: 90 , width: self.view.frame.height, height: 90)
        }
        
       
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addOtherView()
        
       otherView.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 90)
        
        PayBtn.setTitle("Pay $590", for: .normal)
        PayBtn.layer.cornerRadius = PayBtn.frame.height/2
        
    //    othersView.frame = CGRect(x: 0, y: 90+epopView.frame.height, width: self.view.frame.width, height: 90)
        
        let path = Bundle.main.path(forResource: "BankDetailDTO", ofType: "json")
        
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf:url)
        
        bankDetailDtos = try! JSONDecoder().decode([BankDetailDTO].self, from: data!)
        
        addEWalletView()
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        setTitle(title: "Make Payment")
        setNavBar()
      
    
    }
    
    func addEWalletView(){
        
        
        epopView.frame = CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: 90)
        
         let n = bankDetailDtos.count
        
        for i in 0...n/2-1 {
            for j in 0...1 {
                if (2*i+j < n){
                    let temp = setLabel(frame: .init(), x: CGFloat(i), y: CGFloat(j))
                    temp.name.text = bankDetailDtos[2*i+j].bankName
                    temp.name.sizeToFit()
                    
                    temp.tag = 2*i+j
                    let tap = UITapGestureRecognizer(target: self, action: #selector(walletClicked(sender:)))
                   
                    temp.addGestureRecognizer(tap)
                    
                    walletArray.append(temp)
                }
            }
        }
        
        for i in walletArray {
        
            epopView.addSubview(i)
           
        }
        epopView.frame = CGRect(x: 0, y: 90, width: Int(self.view.frame.size.width), height: walletArray.count*35)

        
        othersView.frame = CGRect(x: 0, y: 90 , width: self.view.frame.height, height: 90)
        epopView.isHidden = true
        scrollView.addSubview(epopView)
    }
    
   
    @objc func walletClicked(sender : UIGestureRecognizer){
        let id = sender.view?.tag
        
        if(walletArray[id!].button.image(for: .normal) == #imageLiteral(resourceName: "ic_radiooff")){
            for i in walletArray{
                i.button.setImage(#imageLiteral(resourceName: "ic_radiooff"), for: .normal)
            }
            walletArray[id!].button.setImage(#imageLiteral(resourceName: "ic_radio_on"), for: .normal)
        }else{
            walletArray[id!].button.setImage(#imageLiteral(resourceName: "ic_radiooff"), for: .normal)
        }
        
    }
   
    func addOtherView(){
        othersView.frame = CGRect(x: 0, y: 90 + epopView.frame.height, width: self.view.frame.height, height: 90)
        othersView.backgroundColor = UIColor(displayP3Red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1)
        scrollView.addSubview(othersView)
    }
    
    func setNavBar(){
        
        let cris = UIImageView(image: #imageLiteral(resourceName: "cris_logo_blue"))
        cris.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let logo = UIView()
        logo.backgroundColor = UIColor.white
        logo.frame = CGRect(x: 0, y: 0, width: 42, height: 42)
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.clipsToBounds = true
        
        logo.addSubview(cris)
        
        self.navigationItem.setRightBarButtonItems([UIBarButtonItem(customView : logo),UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)], animated: true)
        
    }
    
     
   

   
}

