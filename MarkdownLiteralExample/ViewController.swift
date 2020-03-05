//
//  ViewController.swift
//  MarkdownLiteralExample
//
//  Created by Danilo Campos on 3/5/20.
//  Copyright © 2020 Danilo Campos. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webview = WKWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let markdown: MarkdownFile = "markdown.md"

        if let html = markdown.htmlRepresentation {
            webview.loadHTMLString(html, baseURL: nil)
        }

        self.title = markdown.bundleName
    }
    
    override func loadView() {
        super.loadView()
        
        self.view = webview
    }


}

