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
    let opopView = UIView()
    
    
    let othersBtn = UIButton()
    let othersView = UIView()
    
    var bankDetailDtos = [BankDetailDTO]()
     var walletArray = [setLabel]()
    var othersArray = [setLabel]()
    
    @IBOutlet weak var eWalletBtn: UIButton!
    @IBOutlet weak var eWalletView: UIView!
    
   
    
    
    

    @IBOutlet weak var PayBtn: UIButton!
    
    
    @IBAction func eWalletPressed(_ sender: Any) {
        
        if eWalletBtn.image(for: .normal) == #imageLiteral(resourceName: "ic_radio_yellow_off")  {
            eWalletBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_on"), for: .normal)
            if othersBtn.image(for: .normal) == #imageLiteral(resourceName: "ic_radio_yellow_on") {
                othersClicked(sender: UIButton())
            }
            opopView.isHidden = true
            epopView.isHidden = false
            
             othersView.frame = CGRect(x: 0, y: 90 + epopView.frame.height, width: self.view.frame.height, height: 90)
            
        }else {
            eWalletBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_off"), for: .normal)
            epopView.isHidden = true
             othersView.frame = CGRect(x: 0, y: 90 , width: self.view.frame.height, height: 90)
            opopView.frame = CGRect(x: 0, y: 190, width: self.view.frame.height, height: 90)
        }
        
       
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addOtherViewBar()
        
        othersBtn.addTarget(self, action: #selector(othersClicked), for: UIControlEvents.touchUpInside)
        
        PayBtn.setTitle("Pay $590", for: .normal)
        PayBtn.layer.cornerRadius = PayBtn.frame.height/2
        
  
        
        let path = Bundle.main.path(forResource: "BankDetailDTO", ofType: "json")
        
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf:url)
        
        bankDetailDtos = try! JSONDecoder().decode([BankDetailDTO].self, from: data!)
        
        addEWalletView()
       
    }
    @objc func othersClicked(sender : UIButton)
    {
        if othersBtn.image(for: .normal) == #imageLiteral(resourceName: "ic_radio_yellow_off") {
            if(eWalletBtn.image(for: .normal) == #imageLiteral(resourceName: "ic_radio_yellow_on")){
                eWalletPressed((Any).self)
            }
            
            othersBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_on"), for: .normal)
            addOthersView()
            opopView.isHidden = false
            
        }else {
            othersBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_off"), for: .normal)
            opopView.isHidden = true
            
        }
        
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
        
        
        
        epopView.isHidden = true
        scrollView.addSubview(epopView)
    }
    
    
    func addOthersView(){
        
   
        opopView.frame = CGRect(x: 0, y: 180 , width: self.view.frame.height, height: 90)
        let n = 4
        for i in 0...n/2-1 {
            for j in 0...1 {
                if (2*i+j < n){
                    let temp = setLabel(frame: .init(), x: CGFloat(i), y: CGFloat(j))
                   // temp.name.text = bankDetailDtos[2*i+j].bankName
                    temp.name.sizeToFit()
                    
                    temp.tag = 2*i+j
                    let tap = UITapGestureRecognizer(target: self, action: nil)
                    
                    temp.addGestureRecognizer(tap)
                    
                    othersArray.append(temp)
                }
            }
        }
        for i in othersArray {
            
            opopView.addSubview(i)
            
        }
        opopView.frame = CGRect(x: 0, y: 190, width: Int(self.view.frame.size.width), height: othersArray.count*35)
        
        opopView.isHidden = true
        scrollView.addSubview(opopView)
    }
    @objc func walletClicked(sender : UIGestureRecognizer){
        let id = sender.view?.tag
        
        if(walletArray[id!].button.image(for: .normal) == #imageLiteral(resourceName: "ic_radiooff")){
            for i in walletArray{
                i.button.setImage(#imageLiteral(resourceName: "ic_radiooff"), for: .normal)
            }
            walletArray[id!].button.setImage(#imageLiteral(resourceName: "ic_radio_on"), for: .normal)
            
            if id == 3 {
                performSegue(withIdentifier: "showPaytm", sender: (Any).self)
            }
        }else{
            walletArray[id!].button.setImage(#imageLiteral(resourceName: "ic_radiooff"), for: .normal)
        }
        
    }
    
    
   
    func addOtherViewBar(){
        othersView.frame = CGRect(x: 0, y: 90 + epopView.frame.height, width: self.view.frame.height, height: 90)
        othersBtn.frame = CGRect(x: 20, y: 30, width: 30, height: 30)
        othersBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_off"), for: .normal)
        othersView.addSubview(othersBtn)
        othersView.backgroundColor = UIColor(displayP3Red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1)
        let othersLabel = UILabel()
        othersLabel.text = "BHIM/UPI, others"
        othersLabel.frame = CGRect(x: 80, y: 20, width: 300, height: 50)
        othersLabel.font = UIFont(name: "Avenir Next", size: 20)
        othersLabel.textColor = UIColor.white
        othersView.addSubview(othersLabel)
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

