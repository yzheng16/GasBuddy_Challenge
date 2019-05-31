//
//  MainController.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-05-30.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class MainController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    var photos: [Photo]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 238, g: 238, b: 244)
        
        navigationItem.title = "Photos"
        
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: cellId)
        fetchPhotos()
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
                    self.photos?.append(photo)
                }
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }catch let jsonError {
                print(jsonError)
            }
            
            
        }.resume()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeCell
        cell.photo = self.photos![indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
//        let postController = PostController(collectionViewLayout: layout)
        let photoDetailController = PhotoDetailController()
        navigationController?.pushViewController(photoDetailController, animated: true)
    }
}
