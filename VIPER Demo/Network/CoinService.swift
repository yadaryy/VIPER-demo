//
//  CoinHTTPService.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import Foundation
import Alamofire

public protocol BaseCoinService {
    func getCoinList(completion: @escaping (Result<[CoinList]?, Error>) -> Void)
}

class CoinService: BaseCoinService{
    func getCoinList(completion: @escaping (Result<[CoinList]?, Error>) -> Void) {
        request(router: CoinRouter.getCoinList, completion: completion)
    }
}

extension CoinService {
    private func request<T: Decodable>(router: HttpRouter, completion: @escaping (Result<T, Error>) -> ()) {
        AF.request(router).response{ response in
            switch response.result {
            case .success(let data) :
                do {
                    let results = try JSONDecoder().decode(T.self, from: data!)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
