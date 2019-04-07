//
//  YvProperties.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import Foundation

class YvProperties {
    
    var tags: YvTag
    var objectId: String
    
    init(jsonData: [String: Any]) {
        self.tags = YvTag(jsonData: jsonData["tags"] as! [String : Any])
        self.objectId = jsonData["objectId"] as? String ?? ""
        
    }
    
}
