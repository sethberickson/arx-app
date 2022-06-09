//
//  Theme.swift
//  arx-app
//
//  Created by Seth Erickson on 6/8/22.
//

import Foundation

// MARK: - Theme
struct Theme: Codable {
    let themeID: Int
    let themeComponent1,
        themeComponent2,
        themeComponent3,
        themeComponent4
    : String
    
    let themeOwner: String

    enum CodingKeys: String, CodingKey {
        case themeComponent1 = "theme_component_1"
        case themeComponent2 = "theme_component_2"
        case themeComponent3 = "theme_component_3"
        case themeComponent4 = "theme_component_4"
        case themeID = "theme_id"
        case themeOwner = "theme_owner"
    }
}
