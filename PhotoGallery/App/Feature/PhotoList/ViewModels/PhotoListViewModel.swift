//
//  PhotoListViewModel.swift
//  PhotoGallery
//
//  Created by Bryan A Bolivar M on 15/03/22.
//

import Foundation
import Moya
import CombineMoya

class PhotoListViewModel {
    
    var photos: [Photo] = []
    
    func loadPhotos(completion: @escaping () -> Void) {
        let provider = MoyaProvider<PhotosAPI>()
        provider.request(.listPhotos) { result in
            switch result {
            case let .success(response):
                print(response)
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: response.data)
                    self.photos = photos
                    completion()
                } catch {
                    print(error)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
