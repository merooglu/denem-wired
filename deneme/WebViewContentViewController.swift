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
    @IBOutlet weak var contentTextView: UITextView!
    
    var webviewContent : MakaleModel!
    var wordArray: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        if let url = URL(string: "\(webviewContent.link!)"){
            print("\(webviewContent.link!)")
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
        
        getArticleContent()
        
    }
    
//    @IBAction func justArticleClicked(_ sender: Any) {
//        self.performSegue(withIdentifier: "justArticle", sender: nil)
//    }
//    
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "justArticle" {
//            let newVC = segue.destination as! ArticleViewController
//            newVC.articleContent = sender as? MakaleModel
//        }
//    }

    
    
    //--------------------
    func getArticleContent () {
        let data = NSData(contentsOf: NSURL(string: "\(webviewContent.link!)")! as URL)
        let doc = TFHpple(htmlData: data! as Data)
        
        if let elements = doc?.search(withXPathQuery: "//p") as? [TFHppleElement] {

            for element in elements{
                contentTextView.text = (contentTextView.text! + " \n------\n " + element.content)
                print("----------")
                print(element.content)
            }
            
        }
        wordCount(s: "\(contentTextView.text)")
        
    }
   
    
    //------------------------
    func wordCount(s: String) -> [String: Int] {
        let words = s.components(separatedBy: " ")
        var wordDictionary : [String: Int] = [:]
        for word in words {
            if wordDictionary[word] == nil {
                wordDictionary[word] = 1
            } else {
                wordDictionary.updateValue(wordDictionary[word]! + 1, forKey: word)
               wordArray.append(word)
                // print("\(wordDictionary[word]!)")
            }
        }
        
        for (kelime, sayi) in wordDictionary {
            print("\(kelime): \(sayi)")
        }
       mostCommomWord(array: wordArray)
        return wordDictionary
    }

    
    func mostCommomWord(array: [String]) -> String {
       
        var wordCountDictionary = [String: Int]()
        
        for word in array {
            if let count = wordCountDictionary[word] {
                wordCountDictionary[word] = count + 1
            }else {
                wordCountDictionary[word] = 1
            }
        }
        
        var mostCommonWord = ""
        
        for key in wordCountDictionary.keys{
            if mostCommonWord == "" {
                mostCommonWord = key
            }else {
                let count = wordCountDictionary[key]
                if count! > wordCountDictionary[mostCommonWord]! {
                    mostCommonWord = key
                }
            }
            print("\(key): \(wordCountDictionary[key]!)")
        }
        
        print("\(mostCommonWord)")
        print("\(wordCountDictionary[mostCommonWord]!+1)")
        return mostCommonWord
    }
    
    
}
