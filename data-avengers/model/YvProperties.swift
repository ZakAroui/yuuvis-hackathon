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
    var objectId: YvObject
    var tenant: YvObject
    
    init(jsonData: [String: Any]) {
        self.tags = YvTag(jsonData: jsonData["tenNyc007:tags"] as! [String : Any])
        self.objectId = YvObject(jsonData: jsonData["enaio:objectId"] as! [String : Any])
        self.tenant = YvObject(jsonData: jsonData["enaio:tenant"] as! [String : Any])
    }
    
}
