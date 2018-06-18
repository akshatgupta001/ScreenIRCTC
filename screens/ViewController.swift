//
//  ViewController.swift
//  screens
//
//  Created by Akshat Gupta on 13/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit

class ViewController: SubView {

    var timer = Timer()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func buttonPressed(_ sender: Any) {
        activityIndicator.isHidden = false
        UIApplication.shared.beginIgnoringInteractionEvents()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: false)
    }
    func action(){
        activityIndicator.isHidden = true
        UIApplication.shared.endIgnoringInteractionEvents()
        performSegue(withIdentifier: "third", sender: Any?.self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       // navigationItem.titleView = label1
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        activityIndicator.isHidden = true
        
        
        
    }

    
   
}

