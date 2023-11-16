//
//  Config.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/14/23.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let APIKEY = "API_KEY"
        }
    }
    
    private static let infoDictionary: [String : Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

let baseURL = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String ?? ""

let APIKEY = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.APIKEY) as? String ?? ""

let sampleURL = baseURL + "q=gongju&appid=" + APIKEY
