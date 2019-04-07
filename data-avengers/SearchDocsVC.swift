//
//  DocumentBrowserViewController.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit
import SwiftGoogleTranslate

class SearchDocsVC: UIViewController {
    let juuv = JuuvisRestClient()

    @IBOutlet weak var searchTerms: UITextField!
    @IBAction func searchBtn(_ sender: Any) {
        print("search clicked")
        
        let terms: String = searchTerms.text!
        
        juuv.searchDocs(completion: {tms in
            
        }, terms: terms)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}

