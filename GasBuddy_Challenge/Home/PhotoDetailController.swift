//
//  PhotoDetailController.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-05-31.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class PhotoDetailController: UIViewController {
    
    var photo: Photo? {
        didSet {
            guard let label = photo?.title else{return}
            navigationItem.title = label
            guard let photoUrl = photo?.thumbnailImageName else{return}
            photoView.loadImage(urlString: photoUrl)
            guard let photographer = photo?.channel?.name else{return}
            photographerValue.text = photographer
            guard let views = photo?.numberOfViews else{return}
            viewsValue.text = "\(views)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(photoView)
        view.addSubview(photographerLabel)
        view.addSubview(photographerValue)
        view.addSubview(viewsValue)
        view.addSubview(viewsLabel)
        photoView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: view.frame.width - 16, heightConstant: view.frame.width - 16)
        photographerValue.anchor(photoView.bottomAnchor, left: nil, bottom: nil, right: photoView.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        photographerLabel.anchor(photoView.bottomAnchor, left: photoView.leftAnchor, bottom: nil, right: photographerValue.leftAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        viewsValue.anchor(photographerValue.bottomAnchor, left: nil, bottom: nil, right: photographerValue.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        viewsLabel.anchor(photographerLabel.bottomAnchor, left: photographerLabel.leftAnchor, bottom: nil, right: viewsValue.leftAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
    let photoView: CustomImageView = {
        let civ = CustomImageView()
        civ.contentMode = .scaleAspectFill
        civ.clipsToBounds = true
        return civ
    }()
    
    let viewsLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.text = "Views"
        return l
    }()
    
    let photographerLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.text = "Photographer"
        return l
    }()
    
    let viewsValue: UILabel = {
        let l = UILabel()
        l.textAlignment = .right
        return l
    }()
    
    let photographerValue: UILabel = {
        let l = UILabel()
        l.textAlignment = .right
        return l
    }()
}
