//
//  UserDefaultManager.swift
//  ChatApp
//
//  Created by SeoYeon Hong on 2023/05/10.
//

import Foundation

struct UserDefaultManager {
    static var userName: String {
        get {
            UserDefaults.standard.string(forKey: "UserName") ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "UserName")
        }
    }
}
