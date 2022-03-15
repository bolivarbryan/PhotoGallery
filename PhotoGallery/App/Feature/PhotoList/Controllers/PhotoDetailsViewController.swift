//
//  PhotoDetailsViewController.swift
//  PhotoGallery
//
//  Created by Bryan A Bolivar M on 15/03/22.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    let imageView: UIImageView = {
        let photoImageView = UIImageView(frame: .zero)
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        return photoImageView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .light)
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    var photo: Photo? {
        didSet {
            guard let photo = photo else { return }
            let url = URL(string: photo.url)
            imageView.kf.setImage(with: url)
            titleLabel.text = photo.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayoutComponents()
    }

    func configureLayoutComponents() {
        addImageView()
        addCaptionDetails()
    }
    
    func addImageView() {
        view.addSubview(imageView)
        imageView.snp.makeConstraints { (make) -> Void in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func addCaptionDetails() {
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalTo(view.safeAreaInsets.bottom).inset(80)
            make.height.greaterThanOrEqualTo(50)
        }

    }
    
}
