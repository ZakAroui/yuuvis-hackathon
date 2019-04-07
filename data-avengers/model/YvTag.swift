//
//  YvProperties.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import Foundation

class YvTag {
    
    var value: [String]
    
    init(jsonData: [String: Any]) {
        self.value = jsonData["value"] as? [String] ?? []
    }
    
}
