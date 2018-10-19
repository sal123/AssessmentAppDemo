//
//  DetailViewController.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIWebViewDelegate {
    var url:String!
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        

        // Do any additional setup after loading the view.
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        //activityIndicator.isHidden = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.isHidden = true
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        activityIndicator.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        webview.loadRequest(URLRequest(url: URL(string: self.url)!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
