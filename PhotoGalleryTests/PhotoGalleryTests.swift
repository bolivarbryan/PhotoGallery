//
//  PhotoGalleryTests.swift
//  PhotoGalleryTests
//
//  Created by Bryan A Bolivar M on 15/03/22.
//

import XCTest
@testable import PhotoGallery

class PhotoGalleryTests: XCTestCase {
    var photo: Photo?

    override func setUpWithError() throws {
        photo = nil
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPhotoDecoding() throws {
        ///Given
        photo = try? JSONDecoder().decode(Photo.self, from: PhotosAPI.listPhotos.samplePhotoData)
        XCTAssertNotNil(photo)
        XCTAssertEqual(1, photo?.albumID)
        XCTAssertEqual("accusamus beatae ad facilis cum similique qui sunt", photo?.title)
        XCTAssertEqual("https://via.placeholder.com/600/92c952", photo?.url)
        XCTAssertEqual("https://via.placeholder.com/150/92c952", photo?.thumbnailURL)
    }
    
    func testPhotoCellSetup() throws {
        photo = try? JSONDecoder().decode(Photo.self, from: PhotosAPI.listPhotos.samplePhotoData)
        let cell = PhotoTableViewCell()
        cell.photo = photo
        XCTAssertEqual("accusamus beatae ad facilis cum similique qui sunt", cell.titleLabel.text)
        
        // Cell Should contain only two subviews: title and image
        cell.configureCell()
        XCTAssertEqual(2, cell.subviews.count)
    }
    
    func testControllerSetup() throws {
        let controller = PhotoListViewController()
        XCTAssertEqual(0, controller.viewModel.photos.count)
        controller.reloadData()
        XCTAssertEqual(controller.tableView.numberOfRows(inSection: 0), 0)
    }
    
    func testViewModelMockedData() {
        let viewModel = PhotoListViewModel()
        XCTAssertEqual(0, viewModel.photos.count)
        let photos = try! JSONDecoder().decode([Photo].self, from: PhotosAPI.listPhotos.sampleData)
        viewModel.photos = photos
        XCTAssertEqual(1, viewModel.photos.count)
    }

}
