//
//  API.swift
//  PhotoGallery
//
//  Created by Bryan A Bolivar M on 15/03/22.
//

import Foundation
import Moya

public enum PhotosAPI {
    case listPhotos
}

extension PhotosAPI: TargetType {

    public var baseURL: URL { return URL(string: "http://jsonplaceholder.typicode.com")! }

    public var path: String {
        switch self {
        case .listPhotos:
            return "/photos"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .listPhotos:
            return .get
        }
    }

    public var task: Task {
        switch self {
        case .listPhotos:
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
        return [:]
    }

    public var sampleData: Data {
        switch self {
        case .listPhotos:
            let jsonString = """
    [{
        "albumId": 1,
        "id": 1,
        "title": "accusamus beatae ad facilis cum similique qui sunt",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952"
      }]
    """
            return jsonString.data(using: String.Encoding.utf8)!
        }
    }
    
    public var samplePhotoData: Data {
        switch self {
        case .listPhotos:
            let jsonString = """
    {
        "albumId": 1,
        "id": 1,
        "title": "accusamus beatae ad facilis cum similique qui sunt",
        "url": "https://via.placeholder.com/600/92c952",
        "thumbnailUrl": "https://via.placeholder.com/150/92c952"
      }
    """
            return jsonString.data(using: String.Encoding.utf8)!
        }
    }
}





