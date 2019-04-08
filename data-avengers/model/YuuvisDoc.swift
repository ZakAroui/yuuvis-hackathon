//
//  YuuvisDoc.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import Foundation

class YuuvisDoc {
    
    var properties: YvProperties
    var contentStreams: [YvContentStream]
    
    init(jsonData: [String: Any]) {
        self.properties = YvProperties(jsonData: jsonData["properties"] as! [String : Any])
        
        let sList = jsonData["contentStreams"] as? [[String: Any]] ?? []
        self.contentStreams = sList.compactMap { s in
            return YvContentStream(jsonData: s) }
    }
    
}
