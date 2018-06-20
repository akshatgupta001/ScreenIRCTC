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
       
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        setTitle(title: "Make Payment")
        setNavBar()
      
    
    }
    
    func addEWalletView(){
        
        
        epopView.frame = CGRect(x: 0, y: 90, width: self.view.frame.size.width, height: 90)
       
        let irctcView = setLabel(frame: .init(), x: 0, y: 0)
        let olaMoneyView = setLabel(frame: .init(),x: 0,y: 1)
        let jioMoneyView = setLabel(frame: .init(),x: 1,y: 0)
        let airtelMoneyView = setLabel(frame: .init(),x: 1,y: 1)
        
        epopView.addSubview(irctcView)
        epopView.addSubview(olaMoneyView)
        epopView.addSubview(jioMoneyView)
        epopView.addSubview(airtelMoneyView)
        
        scrollView.addSubview(epopView)
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

