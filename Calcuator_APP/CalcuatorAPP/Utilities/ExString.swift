//
//  ExString.swift
//  Brightskies_Test
//
//  Created by Walid Elharby on 3/27/21.
//

import Foundation
import UIKit
extension String {
    var localized : String {
        return NSLocalizedString(self, comment: "")
    }
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
           let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
           return boundingBox.height
       }
}
