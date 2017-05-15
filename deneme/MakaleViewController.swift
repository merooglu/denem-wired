//
//  ViewController.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 14.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.


import UIKit

class MakaleViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var makale : Makale?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMakale()
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()

        
        let data = NSData(contentsOf: NSURL(string: "https://www.wired.com/2017/04/missile-defense-will-protect-south-korea-make-china-nervous/")! as URL)
        let doc = TFHpple(htmlData: data! as Data)
        
        if let elements = doc?.search(withXPathQuery: "//p") as? [TFHppleElement] {
            for element in elements{
                print("----------")
                print(element.content)
            }
        }
    }

    func getMakale() {
        
        self.showHud()
        WebService.request(uri: "", methot: .get, parameters: nil, success: { (response: Makale) in
            self.makale = response
            self.tableView.reloadData()
            self.hideHud()
            print("get Başarılı")
        }) { (error: Error) in
            self.hideHud()
            print("get Başarısız")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebviewContent" {
            let newVC = segue.destination as! WebViewContentViewController
            newVC.webviewContent = sender as? MakaleModel
        }
    }

}

