//
//  Che.swift
//  KitchenProject
//
//  Created by Maksim Zakharov on 05.11.2024.
//
import Foundation
import UIKit

final class ChiefCooker {
    // MARK: - IB Outlets

    // MARK: - Public Properties
    
    weak var delegate: ChiefCoockerDelegateProtocol?
    
    // MARK: - Private Properties
    private var dishes = ["0","1","2","3"]
    // MARK: - Initializers
    
    // Первый способ сделать инъекцию зависимости "Dependency injection" при инициализации
    init(delegate: ChiefCoockerDelegateProtocol?) {
        self.delegate = delegate
    }
    
    // Этот инициализатор я создал только для того чтобы показать как сделать инъекцию зависимости "Dependency injection" через свойство.
    init() {
        
    }
    // MARK: - Overrides Methods

    // MARK: - IB Actions

    // MARK: - Public Methods
    
    func requestNextDish() {
        
        let dishImage = makeDish(from: dishes)
        
        delegate?.didReceiveNextDish(dishImage: dishImage)
        
    }
    
    func setDelegate(_ delegate: ChiefCoockerDelegateProtocol) {
        
            self.delegate = delegate
        
    }
    
    // MARK: - Private Methods
    
    private func makeDish(from: [String]) -> UIImage {
        
        guard let dishName = dishes.randomElement() else { return UIImage() }
        
        guard let dish = UIImage(named: dishName) else { return UIImage() }
        
        return dish
    }
    
}
