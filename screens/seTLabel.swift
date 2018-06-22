//
//  seTLabel.swift
//  screens
//
//  Created by Akshat Gupta on 19/06/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import UIKit



class setLabel : UIView {
  
    let button = UIButton()
    let name = UILabel()
    
    
    init(frame: CGRect, x : CGFloat, y : CGFloat) {
        super.init(frame: frame)
        self.frame = CGRect(x: 5 + 205*y, y: 0 + 70*x , width: 200, height: 60)
        self.layer.cornerRadius = self.bounds.width/15
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(eWalletClicked)
//        self.addGestureRecognizer(tap)
        
        button.frame = CGRect(x: 15, y: 21, width: 18, height: 18)
        button.setImage(#imageLiteral(resourceName: "ic_radiooff"), for: .normal)
        self.addSubview(button)
        // text of label
        
        name.frame = CGRect(x: 50, y: 20, width: 140, height: 30)
        self.addSubview(name)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func eWalletClicked(){
        print("clicked")
    }
    
}





