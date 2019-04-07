//
//  DocumentBrowserViewController.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import UIKit
import SwiftGoogleTranslate

class SearchDocsTableViewCell: UITableViewCell {
    @IBOutlet weak var docTitle: UILabel!
    @IBOutlet weak var tenantName: UILabel!
}

class SearchDocsTableVC: UITableViewController {
    var docList: [YuuvisDoc] = []
    var yvDoc: YuuvisDoc?
    var terms: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let juuv = JuuvisRestClient()
        juuv.searchDocs(completion: {tms in
            self.docList = tms!
            self.tableView.reloadData()
        }, terms: terms ?? "")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docList.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
        case "ShowDocInfo":
            print("inside showdocinfo")
//            let webViewVC : WebViewVC = segue.destination as! WebViewVC;
//
//            guard let selectedAssetCell = sender as? TeamAssetTableViewCell else {
//                fatalError("Unexpected sender: \(sender)")
//            }
//
//            guard let indexPath = tableView.indexPath(for: selectedAssetCell) else {
//                fatalError("The selected cell is not being displayed by the table")
//            }
//
//            let selectedAsset = teamAssetList[indexPath.row]
//            webViewVC.sourceVc = WebViewSource.asset
//            webViewVC.teamAsset = selectedAsset
            
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "docCell", for: indexPath) as! SearchDocsTableViewCell
        
        let doc = docList[indexPath.row]
        cell.docTitle?.text = " "+doc.contentStreams[0].fileName
        cell.tenantName?.text = " "+doc.properties.tenant.value
        
        return cell
    }
}
