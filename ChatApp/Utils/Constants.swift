//
//  Constants.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/07.
//

import Foundation
import UIKit

enum Constants {
    enum API {
        
    }
    
    enum Image {
        static let home = "ic_home"
        static let people = "ic_team"
        static let message = "ic_message"
        static let account = "ic_account"
        static let suitcase = "ic_suitcase"
        
        static let close = UIImage(named: "ic_close")
        static let plane = UIImage(named: "ic_plane")
        static let planeFill = UIImage(named: "ic_plane_fill")
    }
    
    enum Color {
        static let main = UIColor(named: "Main")
        static let red = UIColor(named: "Red")
        static let gray100 = UIColor(named: "Gray100")
        static let gray200 = UIColor(named: "Gray200")
        static let gray400 = UIColor(named: "Gray400")
    }
    
    enum Text {
        static let message = "메시지"
    }
}
