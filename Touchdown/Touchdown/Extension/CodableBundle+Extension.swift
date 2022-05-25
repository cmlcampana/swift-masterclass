//
//  CodableBundle+Extension.swift
//  Touchdown
//
//  Created by Camila Campana on 18/05/22.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ fileName: String) -> T {
        guard
            let url = self.url(forResource: fileName, withExtension: nil),
            let data = try? Data(contentsOf: url) else {
            fatalError("Fail to locate file")
        }

        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            fatalError("Fail decode")
        }

        return decodedData
    }
}
