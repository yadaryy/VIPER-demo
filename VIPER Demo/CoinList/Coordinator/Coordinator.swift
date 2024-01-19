//
//  Coordinator.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 19/1/2567 BE.
//

import Foundation
import UIKit
func Coordinator(using navigationController:UINavigationController) -> CoinListViewController{
       
       // Create layers
       let router = CoinListRouter()
       let presenter = CoinListPresenter()
       let interactor = CoinListInteractor()
       let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CoinListViewController") as! CoinListViewController
       
       // Connect layers
       presenter.interactor = interactor
       presenter.router = router
       presenter.view = view
       view.presenter = presenter
       interactor.presenter = presenter
       router.presenter = presenter
       router.navigationController = navigationController
       
       return view
   }
