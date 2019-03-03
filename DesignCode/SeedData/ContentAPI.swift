//
//  ContentAPI.swift
//  DesignCode
//
//  Created by Chase Klingel on 3/2/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import Foundation

class ContentAPI {
    static var shared: ContentAPI = ContentAPI()
    
    lazy var sections: Array<Dictionary<String, String>> = {
        guard let path = Bundle.main.path(forResource: "Sections", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            let sections = try decoder.decode(Array<Dictionary<String, String>>.self, from: data)
            
            return sections
        } catch {
            print(error)
        }
        
        return []
    }()
}
