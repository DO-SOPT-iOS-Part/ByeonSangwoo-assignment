//
//  CountryName.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/14/23.
//

import Foundation

enum CountryName: String {
    case seoul = "Seoul"
    case cheongju = "Cheongju-si"
    case busan = "Busan"
    case jeju = "Jeju City"
    case ulsan = "Ulsan"
    
    func translatedKorean() -> String {
        switch self {
        case .seoul:
            return "서울시"
        case .cheongju:
            return "청주시"
        case .busan:
            return "부산시"
        case .jeju:
            return "제주특별자치도"
        case .ulsan:
            return "울산시"
        }
    }
}
