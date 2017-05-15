//
//  ViewController.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 14.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let data = NSData(contentsOf: NSURL(string: "https://www.wired.com/2017/04/missile-defense-will-protect-south-korea-make-china-nervous/")! as URL)
        let doc = TFHpple(htmlData: data! as Data)
        
        if let elements = doc?.search(withXPathQuery: "//p") as? [TFHppleElement] {
            for element in elements{
                print("----------")
                print(element.content)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

