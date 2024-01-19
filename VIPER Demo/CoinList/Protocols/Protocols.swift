//
//  Protocols.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import Foundation
import UIKit

protocol CoinListDisplayLogic {
    func setupInitialView()
    func showLoading()
    func hideLoading()
    func reloadData()
    func setScreenTitle(with title:String)
}

protocol CoinListPresentationLogic {
    func notifyViewLoaded()
    func notifyViewWillAppear()
    func getDataOnComplete(response:[CoinList]?)
    func getDataOnError(with errorMessage: String)
}


protocol CoinListRoutingLogic{
    func popBack()
    func performSegue(with identifier:String)
    func presentPopup(with message:String)
}

protocol CoinListBusinessLogic {
    func getData()
}
