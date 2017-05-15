//
//  ButtonView.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class ButtonView: UIButton {
    
    @IBInspectable var defaultColor: UIColor!
    @IBInspectable var highlightedColor: UIColor!
    
    var firstLayer: CALayer!
    var secondLayer: CALayer!
    
    override var isHighlighted: Bool {
        didSet{
            if (self.isHighlighted) {
                self.firstLayer!.backgroundColor = self.defaultColor?.cgColor
            } else {
                self.firstLayer!.backgroundColor = self.highlightedColor?.cgColor
            }
        }
    }
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true;
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // First Layer
        if (self.firstLayer == nil) {
            self.firstLayer = CALayer()
            self.firstLayer.frame = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
            self.firstLayer.backgroundColor = self.highlightedColor.cgColor
            self.firstLayer.cornerRadius = 3
            self.layer.insertSublayer(self.firstLayer!, at: 0)
        }
        
        //Second Layer
        if (self.secondLayer == nil) {
            self.secondLayer = CALayer()
            self.secondLayer.frame = CGRect(origin: CGPoint(x: 0, y:0), size: CGSize(width: self.frame.size.width, height: self.frame.size.height - 3) )
            self.secondLayer.backgroundColor = self.defaultColor.cgColor
            self.secondLayer.cornerRadius = 3
            self.layer.insertSublayer(self.secondLayer! , above: self.firstLayer)
        }
        
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 3, 0)
        
    }
    
    override func prepareForInterfaceBuilder() {
        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
    }
    
    
    //Make button to bouncing
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    //        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: .allowUserInteraction, animations: {
    //            self.transform = CGAffineTransform.identity
    //        }, completion: nil)
    //
    //        super.touchesBegan(touches, with: event)
    //    }
    
}
