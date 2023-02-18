//
//  PDFViewController.swift
//  Mobile Library 2.0
//
//  Created by Максим on 18.02.2023.
//

import UIKit
import WebKit

class PDFViewController: UIViewController, WKNavigationDelegate {
    
    private let webView: WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        view.hidesWhenStopped = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
        
    }
    
    // MARK: - Open PDF func
    
    func openBook(url: String) {
        if let bookUrl = URL(string: url) {
            let request = URLRequest(url: bookUrl)
            webView.load(request)
        }

    }
    
    private func setupView() {
        
        view.backgroundColor = .white
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        view.addSubview(activityIndicator)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.heightAnchor.constraint(equalToConstant: 100),
            activityIndicator.widthAnchor.constraint(equalToConstant: 100)
        
        ])
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
}


