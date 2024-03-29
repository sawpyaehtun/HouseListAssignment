
//
//  BaseModel.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 12/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseModel {
    let disposableBag = DisposeBag()
    
    var viewController : BaseViewController?
    var errorObservable = BehaviorRelay<Error?>(value: nil)
    var loadingObservable = BehaviorRelay<Bool>(value: false)
    var isGifLoadingView = false
    
    deinit {
        debugPrint("Deinit \(type(of: self))")
    }
    
    func bindViewModel(in viewController: BaseViewController?) {
        
        self.viewController = viewController
        
        errorObservable.subscribe(onNext: { (error) in
            viewController?.hideLoading()
            if let error = error {
                print(error)
            }
        }).disposed(by: disposableBag)
        
        loadingObservable.subscribe(onNext: { (result) in
            
                if result {
                    viewController?.showLoading()
                } else {
                    viewController?.hideLoading()
                }
            
        }).disposed(by: disposableBag)
    }
}
