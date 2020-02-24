//
//  ChuckJoke.swift
//  chuckDemo
//
//  Created by William Lennartsson on 2020-02-04.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

import Foundation

struct ChuckJoke: Codable {
    let id: String
    let value: String
    private enum CodingKeys : String, CodingKey {
       case value = "joke", id
   }
}

