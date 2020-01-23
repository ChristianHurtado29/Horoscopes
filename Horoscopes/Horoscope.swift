//
//  Horoscope.swift
//  Horoscopes
//
//  Created by Christian Hurtado on 1/23/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

struct Horoscope: Codable{
    let sunsign: String
    let horoscope: String
    let meta: Meta
}

struct Meta: Codable {
    let mood: String
    let keywords: String
    let intensity: String
}
