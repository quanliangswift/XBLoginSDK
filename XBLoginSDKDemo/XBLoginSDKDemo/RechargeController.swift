//
//  RechargeController.swift
//  Community
//
//  Created by 全尼古拉斯 on 2020/5/20.
//  Copyright © 2020 SharpNetwork. All rights reserved.
//

var kScreenWidth: CGFloat {
    return UIScreen.main.bounds.width
}
var kScreenHeight : CGFloat {
    return UIScreen.main.bounds.height
}
var kIsX: Bool {
    if #available(iOS 11.0, *) {
        if UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0 > 0 {
            return true
        }
    }
    return false
}
let kStatusBarHeight: CGFloat = kIsX ? 44 : 20


import UIKit
import XBLoginSDK
class RechargeController: UIViewController {

    var contentView: UIView?
    var titleLabel: UILabel?
    var closeButton: UIButton?
    var topUpColectionView: UICollectionView?
   
    var topUpList: [TopUpItem] = [] {
        didSet {
            topUpColectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTopUpList()
//        XBPaymentManager.shared.payment(productId: "com.xb.Community.group1")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.1) {
            self.view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        }
        
    }
    
    static func showRechargeController(fromVC: UIViewController) {
        let vc = RechargeController.init()
        vc.modalPresentationStyle = .custom
        fromVC.present(vc, animated: true, completion: {
            
        })
    }
    
    func fetchTopUpList() {
        let json1 = """
             {
               
                        "product_id": "com.xbyl.knb20",
                        "ref_name": "100元宝",
                        "display_name": "100元宝",
                        "display_info": "充值得100元宝",
                        "price": 22000
                    }
            """
        let item1 = TopUpItem.init(JSONString: json1)!
        let json2 = """
                         {
                                     "product_id": "com.xbyl.knb50",
                                     "ref_name": "250元宝",
                                     "display_name": "250元宝",
                                     "display_info": "充值得250元宝",
                                     "price": 45000
                                 }
                        """
        let item2 = TopUpItem.init(JSONString: json2)!
        topUpList = [item1, item2]
        topUpColectionView?.reloadData()
    }
    func setupUI() {
        
        self.view.backgroundColor = UIColor.white
        
        contentView = UIView(frame: self.view.bounds)
        contentView?.backgroundColor = UIColor.white
        self.view.addSubview(contentView!)
        
        
        titleLabel = UILabel()
        contentView!.addSubview(titleLabel!)
        
        titleLabel?.frame = CGRect.init(x: kScreenWidth / 2 - 50, y: 20 + kStatusBarHeight, width: 100, height: 40)
        titleLabel!.textColor = UIColor.black
        titleLabel!.font = UIFont.systemFont(ofSize: 18)
        titleLabel!.text = "Encharge"
        titleLabel?.textAlignment = .center
        
        closeButton = UIButton()
        contentView!.addSubview(closeButton!)
        closeButton?.frame = CGRect.init(x: kScreenWidth - 110, y: 10 + kStatusBarHeight, width: 100, height: 40)

        closeButton!.setTitleColor(UIColor.black, for: .normal)
        closeButton!.backgroundColor = UIColor.clear
        closeButton!.addTarget(self, action: #selector(onClickCloseButton), for: .touchUpInside)
        closeButton?.setTitle("close", for: .normal)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 20)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize.init(width: 120, height: 100)
        
        topUpColectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 70 + kStatusBarHeight, width: kScreenWidth, height: kScreenHeight - (70 + kStatusBarHeight)), collectionViewLayout: layout)
        contentView!.addSubview(topUpColectionView!)
            
        topUpColectionView!.delegate = self
        topUpColectionView!.dataSource = self
        topUpColectionView!.backgroundColor = UIColor.lightGray
        topUpColectionView?.register(TopUpItemCollectionCell.self, forCellWithReuseIdentifier: "TopUpItemCollectionCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(receiveRechargeSuccess), name: NSNotification.Name.init("recharge_success_noti"), object: nil)
        
    }
    
    @objc func receiveRechargeSuccess() {
    }
    
    @objc func onClickCloseButton() {
        self.view.backgroundColor = UIColor.clear
        self.dismiss(animated: true, completion: nil)
    }
}

extension RechargeController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topUpList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopUpItemCollectionCell", for: indexPath) as! TopUpItemCollectionCell
        cell.setupData(topUpItem: topUpList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = topUpList[indexPath.item]
        startBuy(item: item)
    }
    
    func startBuy(item: TopUpItem?) {
        guard let product_id = item?.product_id, let price = item?.price else {
            return
        }
        XBLoginSDKManager.shared.startEncharge(notifyUrl: "http://www.baidu.com", cp_order_no: "\(arc4random()%100000)", product_id: product_id, order_amount: price, xb_signature: "ssss", product_name: item?.display_name, product_desc: item?.display_info, vip: nil, balance: nil, party: nil, role_id: nil, role_name: nil, server_name: nil, ext_info: nil)
    }
}
