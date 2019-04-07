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
    var terms: String = ""
    
    @IBOutlet weak var searchTerms: UITextField!
    @IBAction func searchBtn(_ sender: Any) {
        print("search clicked")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "showSearch":
            print("inside showsearch")
            
            let tabBarC : SearchDocsTableVC = segue.destination as! SearchDocsTableVC;
            
            tabBarC.terms = searchTerms.text!
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}

