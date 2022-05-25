//
//  PageModel.swift
//  Pinch
//
//  Created by Camila Campana on 11/05/22.
//

import Foundation

struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        "thumb-\(imageName)"
    }
}
