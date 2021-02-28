//
//  AssistantFile.swift
//  Navigation
//
//  Created by Ольга Кучменева on 18.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//

import UIKit

extension UIView {
    func toAutoLayout(){
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIImage {
    func alpha(_ value: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
