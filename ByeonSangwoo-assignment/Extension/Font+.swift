//
//  Font+.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 10/26/23.
//

import UIKit

// MARK: - 폰트 명을 열거형으로 선언
enum AppFontName: String {
    
    case boldFont = "SFProDisplay-Bold"
    case mediumFont = "SFProDisplay-Medium"
    case regularFont = "SFProDisplay-Regular"
    case lightFont = "SFProDisplay-Light"
    case thinFont = "SFProDisplay-Thin"
    
    var name: String {
        return self.rawValue
    }
}

extension UIFont {
    
    class func bold(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.boldFont.rawValue, size: size)!
    }

    class func medium(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.mediumFont.rawValue, size: size)!
    }
    
    class func regular(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.regularFont.rawValue, size: size)!
    }
    
    class func light(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.lightFont.rawValue, size: size)!
    }
    
    class func thin(size: CGFloat) -> UIFont {
        return UIFont(name: AppFontName.thinFont.rawValue, size: size)!
    }
}
