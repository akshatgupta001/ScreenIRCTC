
//

//  BankDetailDTO.swift

//  nget

//

//  Created by Amit Jha on 11/04/18.

//  Copyright © 2018 cris. All rights reserved.

//



import Foundation





class BankDetailDTO:Decodable {
    
    var  bankId:Int=0
    var  bankName: String?
    var  paymentMode: Int=0
    var  message: String?
    var  enableFlag: Bool=false
    var  offerMsg: String?
    var  offerUrl: String?
    var  disableReason: String?
    var  displaySection: Int=0
    var  cardInputFlag: Int=0
    var  paymentModeName: String?
    
    init(){
        
        bankId = 0
        bankName = ""
        paymentMode = 0
        message = ""
        enableFlag = false
        offerMsg = ""
        offerUrl = ""
        disableReason = ""
        displaySection = 0
        cardInputFlag = 0
        paymentModeName = ""
        
        
    }
    
    private enum CodingKeys: String, CodingKey{
        
        case  bankId
        case  bankName
        case  paymentMode
        case  message
        case  enableFlag
        case  offerMsg
        case  offerUrl
        case  disableReason
        case  displaySection
        case  cardInputFlag
        case  paymentModeName
        
    }
    
    required init(from decoder: Decoder)throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let temp = try container.decodeIfPresent(String.self, forKey: .bankId) {bankId = Int(temp)!}
        if let temp = try container.decodeIfPresent(String.self, forKey: .bankName) {bankName = String(temp)}
        if let temp = try container.decodeIfPresent(String.self, forKey: .paymentMode) {paymentMode = Int(temp)!}
        if let temp = try container.decodeIfPresent(String.self, forKey: .message) {message = String(temp)}
        if let temp = try container.decodeIfPresent(String.self, forKey: .enableFlag) {enableFlag = Bool(temp)!}
        if let temp = try container.decodeIfPresent(String.self, forKey: .offerMsg) {offerMsg = String(temp)}
        if let temp = try container.decodeIfPresent(String.self, forKey: .offerUrl) {offerUrl = String(temp)}
        if let temp = try container.decodeIfPresent(String.self, forKey: .disableReason) {disableReason = String(temp)}
        if let temp = try container.decodeIfPresent(String.self, forKey: .displaySection) {displaySection = Int(temp)!}
        if let temp = try container.decodeIfPresent(String.self, forKey: .cardInputFlag) {cardInputFlag = Int(temp)!}        
        if let temp = try container.decodeIfPresent(String.self, forKey: .paymentModeName) {paymentModeName = String(temp)}
        
        
        
    }
    
}



