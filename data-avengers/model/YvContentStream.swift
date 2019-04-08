//
//  YuuvisDoc.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import Foundation

class YvContentStream {
    
    var fileName: String
    var mimeType: String
    var archivePath: String
    
    init(jsonData: [String: Any]) {
        self.fileName = jsonData["fileName"] as? String ?? ""
        self.mimeType = jsonData["mimeType"] as? String ?? ""
        self.archivePath = jsonData["archivePath"] as? String ?? ""
        
    }
    
}
