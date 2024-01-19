//
//  CoinRouter.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//


import Foundation
import Alamofire


enum CoinRouter {
    case getCoinList
}

extension CoinRouter: HttpRouter{
    
    var baseUrl: URL {
        let url = "https://api.coingecko.com"
        let api = "/api"
        let version = "/v3"
        let coin = "/coin"
        
        return URL(string: url+api+version+coin)!
    }
    
    var path: String {
        switch self {
        case .getCoinList:
            return "/list"
        }
    }
    
    var parameters:[String:String]?{
        switch self {
        case .getCoinList:
            return ["include_platform":"false"]
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getCoinList:
            return .get
        }
    }
    
    var headers: Alamofire.HTTPHeaders? {
        return ["Content-Type":"application/json"]
    }
    
}

