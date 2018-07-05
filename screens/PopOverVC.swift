//
//  PopOverVC.swift
//  screens
//
//  Created by Akshat Gupta on 03/07/18.
//  Copyright © 2018 Akshat Gupta. All rights reserved.
//

import Foundation
import UIKit

class PopOverVC: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate{
    
   
    @IBOutlet weak var Popupview: UIView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var names: [String] = ["Andaman and Nicobar State Co-operative Bank",
        "AP State Co-operative Bank",
        "Arunachal Pradesh State Co-operative Apex Ban",
        "Assam Co-operative Apex Bank",
        "Bihar State Co-operative Bank",
        "Chandigarh State Co-operative Bank",
        "Chhattisgarh Rajya Sahakari Bank Maryadit",
        "Delhi State Co-operative Bank",
        "Goa State Co-operative Bank ltd",
        "Gujarat State Cooperative Agriculture and Rural Development Bank Lt.",
        "Gujarat State Co-operative Bank",
        "Haryana State Co-operative Apex Bank",
    "Himachal Pradesh State Co-operative Bank",
        "Jammu and Kashmir State Co-operativ Bank",
        "Jharkhand State Co-operative Bank",
        "Karnataka State Co-operative Apex Bank Bangalore",
        "Kerala State Co-operative Bank",
       "Madhya Pradesh Rajya Sahakari Bank Maryadit",
       "Maharashtra State Co-operative Bank",
       "Manipur State Co-operative Bank",
   "Meghalaya Co-operative Apex Bank",
   "Mizoram Co-operative Apex Bank",
    "    Nagaland State Co-operative Bank",
     "   Odisha State Co-Operative Bank",
        "Pondichery State Co-operative Bank",
        "Punjab State Co-operative Bank",
        "Rajasthan State Co-operative Bank",
        "Sikkim State Co-operative Bank",
        "The Tamil Nadu State Apex Co-operative Bank",
        "Telangana State Co-Operative Apex Bank Limited",
        "Tripura State Co-operative Bank",
        "Uttar Pradesh Co-operative Bank",
        "Uttarakhand State Co-operative Bank",
        "West Bengal State Co-operative Bank"]
    
    var filteredNames : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        
        filteredNames = names
        
        // Apply radius to Popupview
        Popupview.layer.cornerRadius = 10
        Popupview.layer.masksToBounds = true
        
    }
    
    
    
    // Returns count of items in tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredNames.count;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            filteredNames = names
            tableView.reloadData()
            return
        }
        filteredNames = names.filter({
            name in
            name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    // Select item from tableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
       bankNameShared.shared.bankName = filteredNames[indexPath.row]
       dismiss(animated: true, completion: nil)

    }
    
    //Assign values for tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = filteredNames[indexPath.row]
        
        return cell
    }
    
   
}


