//
//  DocumentUploadViewController.swift
//  data-avengers
//
//  Created by Cesar Lema on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit
import MobileCoreServices

class DocumentUploadViewController: UIViewController, UIDocumentPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "Image"))!)
        self.view.layer.contents = UIImage(named: "Image")!.cgImage
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // ------- Instance Properties -----------------
    // var documentToUploadUrl: URL!  Instance property of model
    var UploadModel = UploadUderDocumentModel()
    
    // ----------------------------------------------
    
    
    // ------- Uploading an Image from files app -----------------
    @IBAction func ChooseImageToUpload(_ sender: UIButton) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypeImage as String], in: .import)
        documentPicker.delegate = self
        present(documentPicker, animated: true)
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard urls.count == 1 else{
            fatalError("Can choose one document")
        }
        //let documentToUpload = urls.first!
        UploadModel.documentToUploadUrl = urls.first!
        print(UploadModel.documentToUploadUrl)
        
    }

    
    // ------- Uploading an Image -----------------
}


