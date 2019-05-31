//
//  PhotoDetailController.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-05-31.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class PhotoDetailController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(photo)
        view.addSubview(dateLabel)
        view.addSubview(date)
        
        photo.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 8, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: view.frame.width - 16, heightConstant: view.frame.width - 16)
        date.anchor(photo.bottomAnchor, left: nil, bottom: nil, right: photo.rightAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 0)
        dateLabel.anchor(photo.bottomAnchor, left: photo.leftAnchor, bottom: nil, right: date.leftAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    let photo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .red
        return iv
    }()
    
    let dateLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .left
        l.text = "Date"
        return l
    }()
    
    let date: UILabel = {
        let l = UILabel()
        l.textAlignment = .right
        l.text = "07/08/2019"
        return l
    }()
}
