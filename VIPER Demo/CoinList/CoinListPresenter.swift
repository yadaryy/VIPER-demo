//
//  CoinListPresenter.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import Foundation
import UIKit


class CoinListPresenter : CoinListPresentationLogic{
    var view: CoinListDisplayLogic?
    var router: CoinListRoutingLogic?
    var interactor:CoinListBusinessLogic?
    
    let kAddressDetailSegueIdentifier = "showCoinListDetail"
    let pageTitle = "Coin List"
}

extension CoinListPresenter {
    
    
    func notifyViewLoaded() {
        view?.setupInitialView()
        interactor?.getData()
    }
    
    func notifyViewWillAppear() {
          view?.setScreenTitle(with: pageTitle)
    }
    
    func getDataOnComplete(response: [CoinList]?) {
        self.view?.viewModel = response
        view?.reloadData()
    }
    
    func getDataOnError(with errorMessage: String) {
        router?.presentPopup(with: errorMessage)
    }
}
