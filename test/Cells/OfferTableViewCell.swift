//
//  OfferTableViewCell.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    @IBOutlet weak var offerImageViewOutlet: UIImageView!
    @IBOutlet weak var offerNameLabelOutlet: UILabel!
    @IBOutlet weak var offerDescriptionLabelOutlet: UILabel!
    @IBOutlet weak var offerDiscountLabelOutlet: UILabel!
    @IBOutlet weak var offerCartButtonOutlet: UIButton!
    @IBOutlet weak var offerUndiscountedPriceLabelOutlet: UILabel!
    @IBOutlet weak var offerFinalPriceOutlet: UILabel!
    @IBOutlet weak var offerDiscountUnderlayingView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(_ offer:(content: Offer, image: UIImage)) {
        offerNameLabelOutlet.text = offer.content.name
        offerDescriptionLabelOutlet.text = offer.content.desc
        offerImageViewOutlet.image = offer.image
        offerImageViewOutlet.layer.cornerRadius = 8
        
        if let discount = offer.content.discount {
            offerDiscountUnderlayingView.isHidden = false
            offerDiscountLabelOutlet.isHidden = false
            offerUndiscountedPriceLabelOutlet.isHidden = false
            offerDiscountLabelOutlet.text = "- \(Int(discount * 100))%"
            offerDiscountUnderlayingView.layer.cornerRadius = 12
            if let price = offer.content.price {
                let undiscountedPrice = NSMutableAttributedString(string: "\(price) ₽")
                undiscountedPrice.addAttribute(.strikethroughStyle, value: 1, range: NSMakeRange(0, undiscountedPrice.length))
                offerUndiscountedPriceLabelOutlet.attributedText = undiscountedPrice
                
                offerFinalPriceOutlet.textColor = UIColor(named: "PastelRed")!
                offerFinalPriceOutlet.text = "\(price - Int(Float(price) * discount)) ₽"
            }
        } else {
            offerFinalPriceOutlet.textColor = .black
            offerDiscountLabelOutlet.isHidden = true
            offerDiscountUnderlayingView.isHidden = true
            offerUndiscountedPriceLabelOutlet.isHidden = true
        }
        
        offerCartButtonOutlet.backgroundColor = UIColor(named: "LightestGray")!
        offerCartButtonOutlet.layer.cornerRadius = offerCartButtonOutlet.frame.height / 2
        
        
    }
    
}
