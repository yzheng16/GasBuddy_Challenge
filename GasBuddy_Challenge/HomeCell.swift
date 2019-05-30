//
//  HomeCell.swift
//  GasBuddy_Challenge
//
//  Created by Yi Zheng on 2019-05-30.
//  Copyright © 2019 Yi Zheng. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(navPhoto)
        addSubview(navLabel)
        addSubview(navArrow)
        
        navPhoto.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 22, leftConstant: 8, bottomConstant: 22, rightConstant: 0, widthConstant: 56, heightConstant: 56)
        navLabel.anchor(topAnchor, left: navPhoto.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        navArrow.anchor(topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 40, leftConstant: 0, bottomConstant: 40, rightConstant: 8, widthConstant: 20, heightConstant: 20)
    }
    
    let navPhoto: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .red
        return iv
    }()
    
    let navLabel: UILabel = {
        let l = UILabel()
        l.textAlignment = .center
        l.text = "Test"
        return l
    }()
    
    let navArrow: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "arrowIcon")?.withRenderingMode(.alwaysOriginal)
        return iv
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
