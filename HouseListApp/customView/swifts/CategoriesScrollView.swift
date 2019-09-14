//
//  CategoriesScrollView.swift
//  HouseListApp
//
//  Created by saw pyaehtun on 11/09/2019.
//  Copyright © 2019 saw pyaehtun. All rights reserved.
//

import UIKit

class CategoriesScrollView: UIView {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInitialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInitialization()
    }
    
    func commonInitialization() {
        let view = Bundle.main.loadNibNamed(String(describing: CategoriesScrollView.self), owner: self, options: nil)?.first as! UIView
        view.frame = self.bounds
        self.addSubview(view)
        
        setupTabs(id: 0)

       
    }
    
    private func setupTabs(id : Int){
        let categoriesTitles = ["Top Collection","Near Me","Low to Height Price","Top Collection","Near Me","Low to Height Price"]
        
        var totalTextLenght : CGFloat = 0
        
        for text in categoriesTitles{
            totalTextLenght += CGFloat(((text.count * 10) + 20) - (text.count * 3))
        }
        
        scrollView.contentSize.width = totalTextLenght
        
        var xPositionOfCategoryViews : CGFloat = 0

        for i in 0 ... 5 {
            var widthPerChar = 0
            
            if id == i {
                widthPerChar = 11
            } else {
                widthPerChar = 10
            }
            
            let textWidthViaCount : CGFloat = CGFloat(categoriesTitles[i].count * widthPerChar)
            let paddingLeftAndRight : CGFloat = 20
            let trimAmount : CGFloat = (CGFloat(categoriesTitles[i].count) * 2)
            
            let widthViaRegularLabelLength : CGFloat = (textWidthViaCount + paddingLeftAndRight) - trimAmount
            
            let categoryView = CategoryView(frame: CGRect(x: CGFloat(xPositionOfCategoryViews), y: 0, width: widthViaRegularLabelLength, height: self.frame.height))
            
            categoryView.id  = i
            categoryView.lblCategory.text = categoriesTitles[i]
            
            if id == i {
                categoryView.imgSelectedIndecator.isHidden  =  false
                categoryView.lblCategory.textColor = UIColor.darkGray
                categoryView.lblCategory.font = UIFont.boldSystemFont(ofSize: 15)
            } else  {
                categoryView.imgSelectedIndecator.isHidden  =  true
                categoryView.lblCategory.textColor = UIColor.lightGray
                categoryView.lblCategory.font = categoryView.lblCategory.font.withSize(12)
            }
            let tapGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(didTapCategory(sender:)))
            categoryView.isUserInteractionEnabled = true
            categoryView.addGestureRecognizer(tapGestureRecogniser)
            xPositionOfCategoryViews += categoryView.viewParent.frame.width
            scrollView.addSubview(categoryView)
        }
    }
    
    @objc func didTapCategory(sender : UITapGestureRecognizer){
        
        guard let categoryView =  sender.view as? CategoryView else {return}
        
        let id = categoryView.id
        
        for view in scrollView.subviews {
            view.removeFromSuperview()
        }
        
        setupTabs(id: id!)
        
    }
    

}
