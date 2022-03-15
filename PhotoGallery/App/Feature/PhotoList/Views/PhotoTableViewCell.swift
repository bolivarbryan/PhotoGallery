//
//  PhotoTableViewCell.swift
//  PhotoGallery
//
//  Created by Bryan A Bolivar M on 15/03/22.
//

import UIKit
import Kingfisher

class PhotoTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return titleLabel
    }()
    
    let photoImageView: UIImageView = {
        let photoImageView = UIImageView(frame: .zero)
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        return photoImageView
    }()
    
    var photo: Photo? {
        didSet {
            guard let photo = photo else { return }
            let url = URL(string: photo.thumbnailURL)
            photoImageView.kf.setImage(with: url)
            titleLabel.text = photo.title
        }
    }
    
    func configureCell() {
        addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make -> Void in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(photoImageView.snp.width)
        }
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make -> Void in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
            make.top.equalTo(photoImageView.snp.bottom)
        }
    }

}
