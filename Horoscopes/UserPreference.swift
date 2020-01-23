//
//  UserPreference.swift
//  Horoscopes
//
//  Created by Christian Hurtado on 1/23/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

enum Sign: String {
    case aries = "Aries"
    case taurus = "Taurus"
    case gemini = "Gemini"
    case cancer = "Cancer"
    case leo = "Leo"
    case virgo = "Virgo"
    case libra = "Libra"
    case scorpio = "Scorpio"
    case sagittarius = "Sagittarius"
    case capricorn = "Capricorn"
    case aquarius = "Aquarius"
    case pisces = "Pisces"
}

struct UserPreferenceKey {
    static let name = "Name"
    static let sign = "Sign"
}

class UserPreference {
    
    private init() {}
    
    static let shared = UserPreference()
    
    func getName() -> String? {
        guard let selName = UserDefaults.standard.object(forKey: UserPreferenceKey.name) as? String else {
            return nil
        }
        return selName
    }
    
    func updateName(with name: String) {
        UserDefaults.standard.set(name, forKey: UserPreferenceKey.name)
    }
    
    func updateSign(with sign: Sign.RawValue) {
        UserDefaults.standard.set(sign, forKey: UserPreferenceKey.sign)
    }
    
    func getUsersSign() -> Sign.RawValue? {
        guard let zodiac = UserDefaults.standard.object(forKey: UserPreferenceKey.sign) as? String else {
            return nil
        }
        return Sign(rawValue: zodiac)
            .map { $0.rawValue }
    }
    
}
