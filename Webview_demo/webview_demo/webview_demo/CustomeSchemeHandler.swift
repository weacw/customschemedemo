//
//  CustomeSchemeHandler.swift
//  webview_demo
//
//  Created by NSWell on 2020/10/20.
//

import Foundation
import UIKit
import WebKit

enum WebErrors: Error {
    case RequestFailedError
}

@available(iOS 11.0, *)

class CustomeSchemeHandler : NSObject,WKURLSchemeHandler {

    func webView(_ webView: WKWebView, start urlSchemeTask: WKURLSchemeTask) {
        DispatchQueue.global().async {
            if let url = urlSchemeTask.request.url, url.scheme == Constants.customURLScheme {
                if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems {
                    for queryParams in queryItems {
                        //example : custom-scheme:// path ? type=remote & url=http://placehold.it/120x120&text=image1
                       print(queryParams)
                    }
                }
            }
        }
    }

    func webView(_ webView: WKWebView, stop urlSchemeTask: WKURLSchemeTask) {
        urlSchemeTask.didFailWithError(WebErrors.RequestFailedError)
    }
}
