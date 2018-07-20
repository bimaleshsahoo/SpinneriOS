//
//  ViewController.swift
//  SpinerViewiOS
//
//  Created by SumitKumar on 01/06/18.
//  Copyright © 2018 SumitKumar. All rights reserved.
//

import UIKit

enum OPTION_TYPE : Int {
    
    case Country_Type
    case Color_Type
    case Zone_Type
}

class ViewController: UIViewController, SpinnerViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var btnClick: UIButton!
    @IBOutlet weak var btnColorType: UIButton!
    @IBOutlet weak var txtFldInput: UITextField!
    var spinerView = SpinnerView()
    var spinerViewColor = SpinnerView()
    let spinerViewZon = SpinnerView()
    let SPINNER_TAG : Int = 1000
    let arrCountry : [String] = ["India",
                                 "Japan",
                                 "USA",
                                 "China",
                                 "India",
                                 "India",
                                 "India",
                                 "India",
                                 "India",
                                 "India",
                                 "India",
                                 "India",
                                 "India",
                                 "Rusia"]
    let arrColors : [String] = ["Blue",
                                "Green",
                                "yellow",
                                "Red",
                                "White"]

    let arrZones : [String] = ["South",
                               "North",
                               "West",
                               "east"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Design After StoryBoard
    func showSpinnerView(withFrame senderFrame : CGRect, withData arrData: [String], withTag tag : Int, isUpSide : Bool) {
        spinerView.frame = CGRect.init(x: 0, y: 0, width: GLOBAL_CONSTANT.SCREEN_WIDTH.width, height: GLOBAL_CONSTANT.SCREEN_WIDTH.height)
        
        spinerView.setupViewComponents(frame: senderFrame, arrOptions: arrData, isShowListUpside: isUpSide)
        spinerView.delegate = self
        
        view.addSubview(spinerView)
    }
    func showSpinnerViewForColor(withFrame senderFrame : CGRect, withData arrData: [String], withTag tag : Int, isUpSide : Bool) {
        spinerViewColor.frame = CGRect.init(x: 0, y: 0, width: GLOBAL_CONSTANT.SCREEN_WIDTH.width, height: GLOBAL_CONSTANT.SCREEN_WIDTH.height)
        
        spinerViewColor.setupViewComponents(frame: senderFrame, arrOptions: arrData, isShowListUpside: isUpSide)
        spinerViewColor.delegate = self
        view.addSubview(spinerViewColor)
    }
    
    func showSpinnerViewForZone(withFrame senderFrame : CGRect, withData arrData: [String], withTag tag : Int, isUpSide : Bool) {
        spinerViewZon.frame = CGRect.init(x: 0, y: 0, width: GLOBAL_CONSTANT.SCREEN_WIDTH.width, height: GLOBAL_CONSTANT.SCREEN_WIDTH.height)
        spinerViewZon.setupViewComponents(frame: senderFrame, arrOptions: arrData, isShowListUpside: isUpSide)
        spinerViewZon.delegate = self
        view.addSubview(spinerViewZon)
    }

    //MARK: Button Actions
    @IBAction func btnClickAction(_ sender: Any) {
        let btnSender = sender as! UIButton
        showSpinnerView(withFrame: btnSender.frame, withData: arrCountry, withTag: SPINNER_TAG + OPTION_TYPE.Country_Type.rawValue, isUpSide: false)        
    }
    
    @IBAction func btnColorAction(_ sender: Any) {
        let btnSender = sender as! UIButton
        //showSpinnerView(withFrame: btnSender.frame, withData: arrColors, withTag: SPINNER_TAG + OPTION_TYPE.Color_Type.rawValue, isUpSide: false)
        showSpinnerViewForColor(withFrame: btnSender.frame, withData: arrColors, withTag: SPINNER_TAG + OPTION_TYPE.Color_Type.rawValue, isUpSide: false)
        //
    }
    
    //MARK: TextField Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //showSpinnerView(withFrame: textField.frame, withData: arrZones, withTag: SPINNER_TAG + OPTION_TYPE.Zone_Type.rawValue, isUpSide: true)
        showSpinnerViewForZone(withFrame: textField.frame, withData: arrZones, withTag: SPINNER_TAG + OPTION_TYPE.Color_Type.rawValue, isUpSide: true)

        return false
    }
    
    //MARK: SpinnerView Delegate
    func didSelectOptionFromList(SpinnerView: SpinnerView, index: Int, slectedValue: String) {
        
        //let tag = SpinnerView.tag - SPINNER_TAG
        switch SpinnerView {
        case spinerView:
            btnClick.setTitle(slectedValue , for: .normal)
            spinerView.removeFromSuperview()
            break
        case  spinerViewColor:
            btnColorType.setTitle(slectedValue , for: .normal)
            spinerViewColor.removeFromSuperview()
            break
        case spinerViewZon:
            txtFldInput.text = slectedValue
            spinerViewZon.removeFromSuperview()
            break
        default:
            break
        }
    }
    
    func didTapBackGround() {
        spinerView.removeFromSuperview()
        spinerViewColor.removeFromSuperview()
        spinerViewZon.removeFromSuperview()
    }

    //MARK: Memory
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

