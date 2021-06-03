//
//  TopUpItemCollectionCell.swift
//  XBLoginSDK
//
//  Created by 全尼古拉斯 on 2021/6/1.
//

import UIKit
import Kingfisher
class TopUpItemCollectionCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
  
    var bottomView: UIView?
    var iconImageView: UIImageView?
    var descLabel: UILabel?
    var priceLabel: UILabel?
    var topUpItem: TopUpItem? {
        didSet {
            iconImageView?.image = UIImage.init(named: "ic_diamond")
            descLabel?.text = topUpItem?.display_name ?? ""
            priceLabel?.text = "\(topUpItem?.price ?? 0)"
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setupUI() {
        bottomView = UIView()
        bottomView?.frame = CGRect.init(x: 0, y: 0, width: 120, height: 100)
        contentView.addSubview(bottomView!)
        
        iconImageView = UIImageView.init(frame: CGRect.init(x: 30, y: 5, width: 60, height: 40))
        bottomView?.addSubview(iconImageView!)
        iconImageView?.contentMode = .scaleAspectFit
        
        
        descLabel = UILabel()
        bottomView?.addSubview(descLabel!)
        descLabel?.frame = CGRect.init(x: 0, y: 50, width: 120, height: 20)
        descLabel?.textColor = UIColor.black
        descLabel?.textAlignment = .center
        descLabel?.font = UIFont.systemFont(ofSize: 12)
        
        priceLabel = UILabel()
        bottomView?.addSubview(priceLabel!)
        priceLabel?.frame = CGRect.init(x: 0, y: 75, width: 120, height: 25)
        priceLabel?.textColor = UIColor.red
        priceLabel?.textAlignment = .center
        priceLabel?.font = UIFont.systemFont(ofSize: 13, weight: .medium)
    }
    
  
    func setupData(topUpItem: TopUpItem) {
        self.topUpItem = topUpItem
    }
}
