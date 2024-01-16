//
//  CollectionVIewCell+Extension.swift
//  SeSACNetworkAssignment
//
//  Created by 김진수 on 1/16/24.
//

import Foundation
import UIKit

extension UICollectionViewCell: ReusableProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
