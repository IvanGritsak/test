//
//  BannersTableViewCell.swift
//  test
//
//  Created by Иван Грицак on 02.12.2020.
//

import UIKit

class BannersTableViewCell: UITableViewCell {

    @IBOutlet weak var bannersCollectionViewOutlet: UICollectionView!

    var banners: [(Banner, UIImage)] = []
    
    private let sectionInsets = UIEdgeInsets(top: 0.0,
                                             left: 12.0,
                                             bottom: 0.0,
                                             right: 12.0)
    
    var cellWidth: CGFloat = 0
    var cellHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        prepareCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func prepareCell() {
        NetworkService().getBanners { [weak self] (banners, error) in
            guard let `self` = self else {return}
            if let error = error {
                print("ERROR: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.banners = banners
                self.bannersCollectionViewOutlet.reloadData()
            }
        }
    }

}

extension BannersTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannersCollectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "bannerCellID", for: indexPath) as! BannerCollectionViewCell
        cell.setupCell(banners[indexPath.row])
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        let width = UIScreen.main.bounds.width * 0.65
        let height = bannersCollectionViewOutlet.bounds.height - 24
        
        cellWidth = width
        cellHeight = height
        
      return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
      return sectionInsets
    }
    


    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        
        let proportionalOffset = bannersCollectionViewOutlet.contentOffset.x / cellWidth
        let index = Int(round(proportionalOffset))
        let safeIndex = max(0, min(banners.count - 1, index))
        
        let indexPath = IndexPath(row: safeIndex, section: 0)
        bannersCollectionViewOutlet.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}
