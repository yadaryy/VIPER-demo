//
//  CoinListInteractor.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import Foundation

class CoinListInteractor{
    
    let coinService : CoinService = CoinService()
    weak var presenter : CoinListPresenter?
    
}

extension CoinListInteractor : CoinListBusinessLogic {

    func getData() {
        print("get data")
        coinService.getCoinList{ response in
            switch response {
                case .success(let response):
                self.presenter?.getDataOnComplete(response: response)
                
            case .failure(let error):
                self.presenter?.getDataOnError(with: String(describing: error))
            }
        }
    }
}
