//
//  ViewController.swift
//  KitchenProject
//
//  Created by Maksim Zakharov on 05.11.2024.
//

import UIKit

class Steward: UIViewController, ChiefCoockerDelegateProtocol {
    // MARK: - IB Outlets
    @IBOutlet var dishImageView: UIImageView!
    
    @IBOutlet var getDishButton: UIButton!
    
    // MARK: - Public Properties

    // MARK: - Private Properties
    private var chief = ChiefCooker()
    
    // MARK: - Initializers

    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // первый способ сделать инъекцию зависимости "Dependency injection" через инициализатор
        chief = ChiefCooker(delegate: self)
        // Второй способ сделать инъекцию зависимости "Dependency injection" через свойство
//        chief.delegate = self
        
        // Третий способ сделать инъекцию зависимости "Dependency injection" через метод
//        chief.setDelegate(self)
        
    }
    // MARK: - IB Actions
    @IBAction func getDish(_ sender: Any) {
        chief.requestNextDish()
    }
    // MARK: - Public Methods
    func didReceiveNextDish(dishImage: UIImage) {
        show(dishImage)
    }
    // MARK: - Private Methods
    private func show(_ dishImage: UIImage) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            
            self.dishImageView.image = dishImage
            
        }
    }
}

