//
//  ContentAPI.swift
//  DesignCode
//
//  Created by Chase Klingel on 3/2/19.
//  Copyright © 2019 Chase Klingel. All rights reserved.
//

import Foundation

struct Section : Codable {
    var title : String
    var caption : String
    var body : String
    var imageName : String
    var publishDate : Date
    
    enum CodingKeys : String, CodingKey {
        case title, caption, body
        case imageName = "image"
        case publishDate = "publish_date"
    }
}

class ContentAPI {
    static var shared : ContentAPI = ContentAPI()
    
    lazy var sections : Array<Section> = {
        guard let path = Bundle.main.path(forResource: "Sections", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let sections = try decoder.decode(Array<Section>.self, from: data)
            
            return sections
        } catch {
            print(error)
        }
        
        return []
    }()
}
