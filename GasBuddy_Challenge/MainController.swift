//
//  MainController.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-05-30.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    let cellId = "cellId"
    var photos: [Photo]?
    var filterPhotos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 238, g: 238, b: 244)
        
//        navigationItem.title = "Photos"
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        fetchPhotos()
        
        let navBar = navigationController?.navigationBar
        navBar?.addSubview(searchBar)
        searchBar.anchor(navBar?.topAnchor, left: navBar?.leftAnchor, bottom: navBar?.bottomAnchor, right: navBar?.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        collectionView?.keyboardDismissMode = .onDrag
    }
    
    func fetchPhotos() {
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!) { (data, response, err) in
            if err != nil {
                print(err ?? "error")
                return
            }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                self.photos = [Photo]()
                
                for dictionary in json as! [[String: AnyObject]] {
                    let photo = Photo()
                    photo.title = dictionary["title"] as? String
                    photo.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    photo.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    photo.channel = channel
                    self.photos?.append(photo)
                }
                self.filterPhotos = self.photos!
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }catch let jsonError {
                print(jsonError)
            }
            
            
        }.resume()
    }
    
    lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.placeholder = "Enter Photo Name"
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor(r: 240, g: 240, b: 240)
        sb.delegate = self
        return sb
    }()
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filterPhotos = photos!
        }else{
            filterPhotos = photos!.filter({ (photo) -> Bool in
                return photo.title!.lowercased().contains(searchText.lowercased())
            })
        }
        self.collectionView?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchBar.isHidden = false
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterPhotos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
//        cell.photo = self.photos![indexPath.item]
        cell.photo = self.filterPhotos[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        searchBar.isHidden = true
        let photoDetailController = PhotoDetailController()
        photoDetailController.photo = photos![indexPath.item]
        navigationController?.pushViewController(photoDetailController, animated: true)
    }
}
