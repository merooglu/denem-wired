//
//  WebViewContentViewController.swift
//  deneme
//
//  Created by Mehmet Eroğlu on 15.05.2017.
//  Copyright © 2017 Mehmet Eroğlu. All rights reserved.
//

import Foundation
import UIKit

class WebViewContentViewController : BaseViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webView : UIWebView!
    
    var webviewContent : MakaleModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        if let url = URL(string: "\(webviewContent.link!)"){
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        
    }
    
    @IBAction func justArticleClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "justArticle", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "justArticle" {
            let newVC = segue.destination as! ArticleViewController
            newVC.articleContent = sender as? MakaleModel
        }
    }
    
}
