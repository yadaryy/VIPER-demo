//
//  CoinListPresenter.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import Foundation


class CoinListPresenter : CoinListPresentationLogic{
    var view: CoinListDisplayLogic?
    var router: CoinListRouter?
    var interactor:CoinListInteractor?
    
    var viewModel:[CoinList]?
    
    let kAddressDetailSegueIdentifier = "showCoinListDetail"
    let pageTitle = "Coin List"
}

extension CoinListPresenter {
    
    func getViewModel() -> [CoinList]? {
        return viewModel
    }
    
    func notifyViewLoaded() {
        view?.setupInitialView()
        view?.showLoading()
        interactor?.getData()
    }
    
    func notifyViewWillAppear() {
          view?.setScreenTitle(with: pageTitle)
    }
    
    func getDataOnComplete(response: [CoinList]?) {
        self.viewModel = response
        view?.hideLoading()
        view?.reloadData()
    }
    
    func getDataOnError(with errorMessage: String) {
        router?.presentPopup(with: errorMessage)
    }
}
