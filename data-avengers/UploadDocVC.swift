//
//  DocumentBrowserViewController.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit
import SwiftGoogleTranslate

class UploadDocVC: UIViewController {
    let juuv = JuuvisRestClient()

    @IBOutlet weak var tagsTF: UITextField!
    @IBAction func uploadDocBtn(_ sender: UIButton) {
        print("clicked")
        let tags: String = tagsTF.text ?? ""
        
        juuv.uploadDoc(tags: tags, onCompletion: {tms in            
            let alertController = UIAlertController(title: "Successfully Uploaded", message:
                "Your Document Was Successfully Uploaded", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }, onError: {tms in
            //            selnt(tms![5].name)
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}

