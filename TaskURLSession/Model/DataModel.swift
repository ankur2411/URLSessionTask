//
//  DataModel.swift
//  TaskURLSession
//
//  Created on 16/01/24.
//

import Foundation
struct DataModel: Decodable, Equatable {
    let title, body: String

    init(title:String,body:String){
        self.title = title
        self.body = body
    }

    enum CodingKeys: String, CodingKey {
        case title, body
    }
}

