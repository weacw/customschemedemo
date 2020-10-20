//
//  ViewController.swift
//  webview_demo
//
//  Created by NSWell on 2020/10/20.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    var wkWebView : WKWebView!
    
    override func loadView() {
        super.viewDidLoad()
        let configuration = WKWebViewConfiguration()
        configuration.setURLSchemeHandler(CustomeSchemeHandler(), forURLScheme: Constants.customURLScheme)
        wkWebView = WKWebView(frame: .zero,configuration:configuration)
        view = wkWebView
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadHtmlIntoWebview()
    }
    
    internal func loadHtmlIntoWebview() -> Void {
        let url = URL(string: "http://glowh5.sandbox.gxar.com/#/info")!
        wkWebView.load(URLRequest(url: url))
        wkWebView.allowsBackForwardNavigationGestures = true
    }
    
    
}

