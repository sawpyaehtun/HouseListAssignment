//
//  ViewController.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 11/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class ForYouViewController: BaseViewController {
   
    @IBOutlet weak var imgPause: UIImageView!
    @IBOutlet weak var imgEqual: UIImageView!
    @IBOutlet weak var homeListTableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    let disposableBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    override func setUpUIs(){
        
        homeListTableView.registerForCell(strID: String(describing: HouseTableViewCell.self))

        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.addTarget(self, action: #selector(fetchHosueList), for: .valueChanged)
        homeListTableView.separatorStyle = .none
        homeListTableView.refreshControl = refreshControl
        
        homeListTableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGestureRecogniser.cancelsTouchesInView = false
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGestureRecogniser)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func fetchHosueList(){
        fetchData()
    }
    
    private func fetchData(){
        HouseModel.shared().apiGetHouseList(success: {
            self.refreshControl.endRefreshing()
        }) { (error) in
            print(error)
        }
    }
    
    override func bindModel() {
        HouseModel.shared().bindViewModel(in: self)
    }
    
    override func bindData(){

        HouseModel.shared().houseList.bind(to: homeListTableView.rx.items(cellIdentifier: String(describing: HouseTableViewCell.self))) { index, model, cell in
            guard let houseTableViewCell = cell as? HouseTableViewCell else {return}
                houseTableViewCell.houseVO = model
            }.disposed(by: disposableBag)
        
//        homeListTableView.rx.modelSelected(HouseVO.self).subscribe{ houseVo in
//
//        }.disposed(by: disposableBag)
        
        Observable.zip(homeListTableView.rx.itemSelected,homeListTableView.rx.modelSelected(HouseVO.self)).bind{[unowned self] (indexPath, houseVO) in
            self.goToHouseDetailScreen(houseVo: houseVO)
            self.homeListTableView.deselectRow(at: indexPath, animated: true)
        }.disposed(by: disposableBag)
    }
    
    private func goToHouseDetailScreen(houseVo : HouseVO){
        let vc = HouseDetailViewController.init()
        vc.houseVO = houseVo
        self.present(vc, animated: true
            , completion:  nil)
    }
}
