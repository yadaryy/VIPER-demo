//
//  HttpRouter.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//
import Alamofire
import Foundation

public protocol HttpRouter : URLRequestConvertible{
    var baseUrl: URL {get}
    var path: String {get}
    var parameters:[String:String]? {get}
    var method: HTTPMethod {get}
    var headers: HTTPHeaders? {get}
}

extension HttpRouter {
    
    func asURLRequest() throws -> URLRequest {
        
        var url = baseUrl
        url.appendPathComponent(path)
        print(url)
        var request = URLRequest(url: url)
        request.method = method
        request = try URLEncodedFormParameterEncoder(destination: .methodDependent)
        .encode(parameters, into: request)
 
        return request
    }
}
