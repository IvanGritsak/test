//
//  BannerCollectionViewCell.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImageViewOutlet: UIImageView!
    @IBOutlet weak var bannerTitleLabelOutlet: UILabel!
    @IBOutlet weak var bannerDescriptionLabelOutlet: UILabel!
    @IBOutlet weak var bannerLowerViewOutlet: UIView!
    
    func setupCell(_ banner: (content: Banner, image: UIImage)) {
        contentView.layer.cornerRadius = 16
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        
        if banner.content.title != nil {
            bannerTitleLabelOutlet.text = banner.content.title
        } else {
            bannerTitleLabelOutlet.isHidden = true
        }
        
        if banner.content.desc != nil {
            bannerDescriptionLabelOutlet.text = banner.content.desc
        } else {
            bannerDescriptionLabelOutlet.isHidden = true
        }
        
        bannerImageViewOutlet.image = banner.image
        
        
        
    }
    
}
