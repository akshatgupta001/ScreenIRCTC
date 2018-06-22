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
    
    var bankDetailDtos = [BankDetailDTO]()
     var walletArray = [setLabel]()
    
    @IBOutlet weak var eWalletBtn: UIButton!
    @IBOutlet weak var eWalletView: UIView!
    
    
    @IBAction func eWalletPressed(_ sender: Any) {
        
        if eWalletBtn.image(for: .normal) == #imageLiteral(resourceName: "ic_radio_yellow_off") {
            eWalletBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_on"), for: .normal)
            addEWalletView()
        }else {
            eWalletBtn.setImage(#imageLiteral(resourceName: "ic_radio_yellow_off"), for: .normal)
            epopView.removeFromSuperview()
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "BankDetailDTO", ofType: "json")
        
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf:url)
        
        bankDetailDtos = try! JSONDecoder().decode([BankDetailDTO].self, from: data!)
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        setTitle(title: "Make Payment")
        setNavBar()
      
    
    }
    
    func addEWalletView(){
        
        
        epopView.frame = CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: 90)
        
        
        
       // var walletArray = [setLabel]()
        
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
        epopView.frame = CGRect(x: 0, y: 90, width: Int(self.view.frame.size.width), height: walletArray.count*70)

        scrollView.addSubview(epopView)
    }
    
    @objc func walletClicked(sender : UIGestureRecognizer){
        let id = sender.view?.tag
        
        if(walletArray[id!].button.image(for: .normal) == #imageLiteral(resourceName: "ic_radiooff")){
            walletArray[id!].button.setImage(#imageLiteral(resourceName: "ic_radio_on"), for: .normal)
        }else{
            walletArray[id!].button.setImage(#imageLiteral(resourceName: "ic_radiooff"), for: .normal)
        }
        
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

