//
//  ChiefCoockerDelegateProtocol.swift
//  KitchenProject
//
//  Created by Maksim Zakharov on 05.11.2024.
//

import Foundation
import UIKit

protocol ChiefCoockerDelegateProtocol: AnyObject {
    
    var dishImageView: UIImageView! { get set }
    
    var getDishButton: UIButton! { get set }
    
    func didReceiveNextDish(dishImage: UIImage)
    
}
