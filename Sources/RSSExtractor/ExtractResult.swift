//
//  ExtractResult.swift
//
//
//  Created by Kevin on 1/11/22.
//

import Foundation

public struct ExtractResult: Codable {
    public let title: String?
    public let author: String?
    public let leadImageURL: String?
    public let content: String
    public let wordCount: Int?

    enum CodingKeys: String, CodingKey {
        case title
        case author
        case leadImageURL = "lead_image_url"
        case content
        case wordCount = "word_count"
    }
}
