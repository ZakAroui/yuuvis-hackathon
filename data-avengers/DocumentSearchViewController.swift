//
//  DocumentSearchViewController.swift
//  data-avengers
//
//  Created by Cesar Lema on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit

class DocumentSearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.contents = UIImage(named: "Image")!.cgImage
        queryTextField.delegate = self
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
    // ------------------Instance Properties ---------------------------
    var queryText: String!
    
    @IBOutlet weak var queryTextField: UITextField!
    @IBOutlet weak var SearchButton: UIButton!
    // --------------------------------------------------------------
    
    // ------------------Instance Properties ---------------------------
    func transitionToDisplayResults()
    { // get documents to display and segue into tableViewcController
        
    }
    // --------------------------------------------------------------
}

extension DocumentSearchViewController: UITextFieldDelegate
{
    func textFieldDidEndEditing(_ textField: UITextField) {
        queryText = textField.text
        print(queryText)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
