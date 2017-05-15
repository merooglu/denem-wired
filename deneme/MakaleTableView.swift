//
//  MakaleTableView.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

extension MakaleViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if makale != nil {
            return (makale?.items.count)!/2
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MakaleTableViewCell", for: indexPath) as! MakaleTableViewCell
        cell.makaleViewController = self
        cell.makaleModel = makale?.items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
}
