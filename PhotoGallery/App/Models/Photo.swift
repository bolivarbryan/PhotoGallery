//
//  Photo.swift
//  PhotoGallery
//
//  Created by Bryan A Bolivar M on 15/03/22.
//

import Foundation

typealias Photos = [Photo]

// MARK: - Photo
struct Photo: Codable {
    /// Album Identifier
    let albumID: Int
    
    /// Photo Id
    let id: Int
    
    /// Photo Caption Title
    let title: String
    
    /// Photo url Reference, use for full screen view
    let url: String
    
    /// Photo Thumbnail reference, use for lists
    let thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}
