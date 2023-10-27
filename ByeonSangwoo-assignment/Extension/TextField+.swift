//
//  TextField+.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 10/27/23.
//

import UIKit

extension UITextField {
    // 왼쪽에 여백 주기
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    // 오른쪽에 여백 주기
    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    // 왼쪽에 이미지 사진 넣기
    func addLeftImage(image: UIImage) {
        let leftImage = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))

        leftImage.image = image
        self.leftView = leftImage
        self.leftViewMode = .always
    }
}
