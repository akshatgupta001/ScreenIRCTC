//
//  SubView.swift
//  screens
//
//  Created by Akshat Gupta on 14/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit


class SubView: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80.0)
        
        self.navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0/255.0, green: 150/255.0, blue: 177/255.0, alpha: 1)


        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        addBar()
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 80.0)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        let cris = UIImageView(image: #imageLiteral(resourceName: "cris_logo_blue"))
        cris.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        let logo = UIView()
        logo.backgroundColor = UIColor.white
        logo.frame = CGRect(x: 0, y: 0, width: 42, height: 42)
        logo.layer.cornerRadius = logo.frame.size.width/2
        logo.clipsToBounds = true
        
        logo.addSubview(cris)
        cris.center = logo.center
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logo)
        
       
        
        let irctc = UIImageView(image: #imageLiteral(resourceName: "irctc_logo_white_bg"))
        irctc.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        let logo1 = UIView()
        logo1.backgroundColor = UIColor.white
        logo1.frame = CGRect(x: 0, y: 0, width: 42, height: 42)
        logo1.layer.cornerRadius = logo.frame.size.width/2
        logo1.clipsToBounds = true
        logo1.addSubview(irctc)
        irctc.center = logo1.center
        
       
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logo1)
        
       // navigationItem.leftBarButtonItems =  [UIBarButtonItem(customView: irctc)]
        
        self.navigationItem.leftItemsSupplementBackButton = true

    }
    func dis(){
        print("123")
        

    }
    
    func addBar(){
        if self.navigationController == nil {
            return
        }
        
        // Create a navView to add to the navigation bar
       let navView = UIView()
        
        // Create the label
        let label = UILabel()
        label.text = "First"
        
        label.sizeToFit()
        label.center = navView.center
        label.textAlignment = NSTextAlignment.center
        
        
       
        
        // Add both the label and image view to the navView
       // navView.addSubview(image)
        navView.addSubview(label)
       
        
        // Set the navigation bar's navigation item's titleView to the navView
        self.navigationItem.titleView = navView
        
        navView.sizeToFit()
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
