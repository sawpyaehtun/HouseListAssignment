//
//  NetworkClient.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 12/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import Alamofire

class NerworkClient {
    private let baseUrl: String
    
    private init(baseUrl : String){
        self.baseUrl = baseUrl
    }
    
    private static var sharedNerworkClient : NerworkClient = {
        let url = SharedConstants.BASE_URL
        return NerworkClient(baseUrl: url)
    }()
    
    class func shared() -> NerworkClient {
        return sharedNerworkClient
    }
    
    public func getData(success: @escaping (Any) -> Void, fauilure: @escaping (String) -> Void){
        Alamofire.request(baseUrl).responseData { (response) in
            switch response.result {
            case .success(let data) :
                success(data)
            case .failure(let err) :
                fauilure(err.localizedDescription)
                break
            }
        }
    }
}
