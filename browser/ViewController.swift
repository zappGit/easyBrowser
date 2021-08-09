//
//  ViewController.swift
//  browser
//
//  Created by Артем Хребтов on 09.05.2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        webView.navigationDelegate = self
        let homePage = "https://www.apple.com"
        let url = URL(string: "https://www.apple.com")
        let request = URLRequest(url: url!)
        textField.text = homePage
        webView.load(request)
        webView.allowsBackForwardNavigationGestures = true
    

    
}

    @IBAction func forwButton(_ sender: UIButton) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        if webView.canGoBack{
            webView.goBack()
        }
    }
}
    extension ViewController: UITextFieldDelegate, WKNavigationDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let urlString = textField.text!
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        textField.resignFirstResponder()
        return true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        textField.text = webView.url?.absoluteString
        backButton.isEnabled = webView.canGoBack
        forwButton.isEnabled = webView.canGoForward
    }
}
