//
//  SpinnerView.swift
//  SpinerViewiOS
//
//  Created by SumitKumar on 01/06/18.
//  Copyright © 2018 SumitKumar. All rights reserved.
//

import UIKit
import Foundation

protocol SpinnerViewDelegate {
    func didSelectOptionFromList(SpinnerView : SpinnerView, index : Int, slectedValue : String)
    func didTapBackGround()
}

class SpinnerView: UIView, UITableViewDelegate, UITableViewDataSource {
    //MARK: Variables
    private var btnBackGround = UIButton()
    private var arroptionList =  NSMutableArray()
    private let TABLEVIEW_CELL_HEIGHT : CGFloat = 44.0
    private let vwConatiner = UIView()
    private let maximumConatainerHeight : CGFloat = 220.0
    private let tblOption = UITableView()
    
    var maxHeight : CGFloat = 0.0
    
    var delegate : SpinnerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    //below override method is required when a view doesn't have an nib file
    required init?(coder aDecoder: NSCoder) {
        print("requiered Method Fired")
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewComponents(frame: CGRect, arrOptions : [String], isShowListUpside : Bool) {
        btnBackGround.frame = CGRect.init(x: 0, y: 0, width: GLOBAL_CONSTANT.SCREEN_WIDTH.width, height: GLOBAL_CONSTANT.SCREEN_WIDTH.height)
        btnBackGround.backgroundColor = UIColor.black.withAlphaComponent(0.1)
        btnBackGround.addTarget(self, action: #selector(btnBAckgroundAction), for:  .touchUpInside)
        //GLOBAL_CONSTANT.APP_DELEGATE.window?.addSubview(btnBackGround)
        self.addSubview(btnBackGround)
        
        if arroptionList.count > 0 {
            arroptionList.removeAllObjects()
        }
        
        arroptionList.addObjects(from: arrOptions)
        
        var containerHeight : CGFloat = CGFloat(Double(arrOptions.count) * Double(TABLEVIEW_CELL_HEIGHT))
        
        if arrOptions.count > 5 {
            containerHeight = (maxHeight == 0.0) ? maximumConatainerHeight : maxHeight
        }

        let containerPosY : CGFloat!
        
        if  isShowListUpside{
            containerPosY = frame.origin.y - containerHeight
        }else{
            containerPosY = frame.origin.y + frame.size.height
        }
        
        vwConatiner.removeFromSuperview()
        vwConatiner.frame = CGRect.init(x: frame.origin.x, y: containerPosY, width: frame.size.width, height: containerHeight)
        vwConatiner.dropShadow(scale: true)
        self.addSubview(vwConatiner)
        self.bringSubview(toFront: vwConatiner)
        
        tblOption.frame = CGRect.init(x: 0, y: 0, width: vwConatiner.frame.size.width, height: vwConatiner.frame.size.height)
        tblOption.dataSource = self
        tblOption.delegate = self
        tblOption.isScrollEnabled = (arrOptions.count <= 5) ? false : true
        //tblOption.registerCellClass(CustomTableViewCell.self)
        tblOption.separatorColor = UIColor.clear
        tblOption.separatorStyle = .none

        vwConatiner.addSubview(tblOption)
    }
    
    
    //MARK: Button Actions
    @objc func btnBAckgroundAction() {
        delegate?.didTapBackGround()
        tblOption.removeFromSuperview()
        vwConatiner.removeFromSuperview()
        btnBackGround.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arroptionList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = CustomTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CustomTableViewCell")

        cell.textLabel?.font = UIFont.italicSystemFont(ofSize: 18)
        cell.textLabel?.text = arroptionList[indexPath.row] as? String

        cell.selectionStyle = .none
        tableView.separatorColor = UIColor.clear
        tableView.separatorStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectOptionFromList(SpinnerView: self, index: indexPath.row, slectedValue: arroptionList[indexPath.row] as! String)
        tblOption.removeFromSuperview()
        vwConatiner.removeFromSuperview()
        btnBackGround.removeFromSuperview()
        
    }
    
}
