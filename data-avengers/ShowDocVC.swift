//
//  DocumentBrowserViewController.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit
import SwiftGoogleTranslate

class ShowDocVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let juuv = JuuvisRestClient()
    var yvDoc: YuuvisDoc? = nil
    var currRow: Int = 0
    
    var pickerData: [String] = [String]()
    
    @IBOutlet weak var docTitle: UILabel!
    @IBOutlet weak var languagePick: UIPickerView!
    @IBAction func downloadDoc(_ sender: Any) {
        print("download here")

        juuv.downloadDoc(completion: {tms in
            
        }, yvDoc: yvDoc!, currRow: currRow)
        
        let alertController = UIAlertController(title: pickerData[currRow]+" Version Successfully Downloaded", message:
            "Your Document Was Successfully Downloaded", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.languagePick.delegate = self
        self.languagePick.dataSource = self
        
        pickerData = ["German", "English", "French", "Italian", "Spanish"]

        if(yvDoc != nil){
            docTitle.text = yvDoc?.contentStreams[0].fileName
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        self.currRow = row
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
}

