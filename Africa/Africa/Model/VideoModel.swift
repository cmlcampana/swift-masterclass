//
//  VideoModel.swift
//  Africa
//
//  Created by Camila Campana on 16/05/22.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String

    var thumbnail: String {
        "video-\(id)"
    }
}
