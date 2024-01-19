//
//  CoinListRouter.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import Foundation
import UIKit

class CoinListRouter {
    weak var presenter: CoinListPresenter?
    weak var navigationController:UINavigationController?
    
}
extension CoinListRouter : CoinListRoutingLogic{
    func popBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func performSegue(with identifier: String) {
        self.navigationController?.visibleViewController?.performSegue(withIdentifier: identifier, sender: nil)
    }
    
    func presentPopup(with message: String) {
        
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
     
        alertController.addAction(UIAlertAction(title: "Allright", style: .default, handler: nil))
        
        self.navigationController?.visibleViewController?.present(alertController, animated: true, completion: nil)
    }
}
