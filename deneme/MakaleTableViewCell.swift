//
//  MakaleTableViewCell.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class MakaleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var pubDateLabel: UILabel!
    
    
    var makaleViewController : MakaleViewController!
    
    var makaleModel : MakaleModel! {
        didSet{
            titleLabel.text = makaleModel.title!
            authorLabel.text = "Author: " + makaleModel.author!
            pubDateLabel.text = "Publication Date: " + makaleModel.pubDate!
        }
    }
}
