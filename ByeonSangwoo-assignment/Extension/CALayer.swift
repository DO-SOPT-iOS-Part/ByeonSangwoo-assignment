//
//  CALayer.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/10/23.
//

import UIKit

extension CALayer {
    func addBorder(to view: UIView, at position: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let border = CALayer()

        switch position {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: view.frame.size.height - thickness, width: view.frame.size.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: view.frame.size.height)
        case .right:
            border.frame = CGRect(x: view.frame.size.width - thickness, y: 0, width: thickness, height: view.frame.size.height)
        default:
            break
        }

        border.backgroundColor = color.cgColor
        view.layer.addSublayer(border)
    }
}
