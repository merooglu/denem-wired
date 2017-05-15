//
//  BaseViewController.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class BaseViewController : UIViewController {
    
    var progressHud : MBProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func showHud() {
        self.progressHud = MBProgressHUD.showAdded(to: self.view, animated: true)
        self.progressHud.bezelView.color = UIColor.lightGray.withAlphaComponent(0.75)
        self.progressHud.label.text = "Please Wait!"
    }
    
    func hideHud () {
        self.progressHud.isHidden = true
    }
}
