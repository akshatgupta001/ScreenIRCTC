//
//  secondVC.swift
//  screens
//
//  Created by Akshat Gupta on 13/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit

class secondVC: SubView {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
       
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        
        
            let label = UILabel()
            label.text = "MAKEPAYMENT"
        
        label.sizeToFit()
            self.navigationItem.titleView = label
        
        let cris = UIImageView(image: #imageLiteral(resourceName: "cris_logo_blue"))
        cris.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let logo = UIView()
        logo.backgroundColor = UIColor.white
        logo.frame = CGRect(x: 0, y: 0, width: 42, height: 42)
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.clipsToBounds = true
        
        logo.addSubview(cris)

        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    
       
        self.navigationItem.setRightBarButtonItems([UIBarButtonItem(customView : logo),UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)], animated: true)
        
       // self.navigationItem.setRightBarButtonItems([UIBarButtonItem(customView : logo)], animated: true)
    
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

