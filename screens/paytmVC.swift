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
   
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        contentView.heightAnchor.constraint(equalToConstant: 700)
        setNavBar()
      
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
