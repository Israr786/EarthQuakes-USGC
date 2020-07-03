//
//  AlbumDetailsViewController.swift
//  DemoTest
//
//  Created by Israrul on 6/30/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation
import UIKit
import WebKit

protocol DetailsViewControllerrotocol:class {
    func refreshUI()
}

final class DetailsViewController: UIViewController, WKUIDelegate {

    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    var viewModel: DetailViewModel? {
        didSet {
            refreshUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
            self.view.backgroundColor = .white
            self.view.addSubview(webView)
            
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
            ])
        }
}

extension DetailsViewController: DetailsViewControllerrotocol {
    func refreshUI() {
        if let viewModel = viewModel, let feature = viewModel.feature {
            let myURL = URL(string: feature.properties.url)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
        
    }
}

