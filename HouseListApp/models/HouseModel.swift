//
//  House.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 12/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class HouseModel : BaseModel{
    
//    var houseResponse: HouseResponse = HouseResponse()
    var houseResponseObserable = BehaviorRelay<HouseResponse?>(value: nil)
    
    var houseList : Observable<[HouseVO]>{
        return houseResponseObserable.map{$0?.data ?? []}
    }
    class func shared() -> HouseModel {
        return sharedHouseModel
    }
    
    private static var sharedHouseModel : HouseModel = {
        return HouseModel()
    }()
    
    
    func apiGetHouseList(success : @escaping () -> Void, faulire: @escaping (String) -> Void) {
        loadingObservable.accept(true)
        NerworkClient.shared().getData(success: { (data) in
            self.loadingObservable.accept(false)
            guard let data = data as? Data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let houseRsponse = try
                    decoder.decode(HouseResponse.self, from: data)
                self.houseResponseObserable.accept(houseRsponse)
                success()
                
            } catch let jsonError{
                print(jsonError)
            }
        }) { (err) in
            self.loadingObservable.accept(false)
            faulire(err)
        }
    }
    
}
