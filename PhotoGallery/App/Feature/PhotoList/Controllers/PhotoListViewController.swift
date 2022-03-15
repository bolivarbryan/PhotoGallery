//
//  PhotoListViewController.swift
//  PhotoGallery
//
//  Created by Bryan A Bolivar M on 15/03/22.
//

import UIKit
import SnapKit

class PhotoListViewController: UIViewController {
    let photoTableViewCell = "PhotoTableViewCell"
    let photoDetailsSegue = "PhotoDetailsSegue"
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: photoTableViewCell)
        return tableView
    }()
    
    var viewModel = PhotoListViewModel()
    var selectedPhoto: Photo?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayoutComponents()
        reloadData()
    }
    
    func configureLayoutComponents() {
        addTableView()
    }
    
    /// Inserts TableView On View and binds datasource/Delegate protocols
    func addTableView() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == photoDetailsSegue {
            guard let destination = segue.destination as? PhotoDetailsViewController else {
                return
            }
            destination.photo = selectedPhoto
        }
    }
    
    // MARK: UI Actions
    
    func presentPhotoDetails() {
        self.performSegue(withIdentifier: photoDetailsSegue, sender: self)
    }
    
    func reloadData() {
        viewModel.loadPhotos {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension PhotoListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: photoTableViewCell ) as? PhotoTableViewCell
        else { return UITableViewCell() }
        cell.configureCell()
        cell.photo = viewModel.photos[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.photos.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPhoto = viewModel.photos[indexPath.row]
        self.presentPhotoDetails()
    }

}
