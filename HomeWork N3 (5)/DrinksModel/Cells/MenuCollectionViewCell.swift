//
//  MenuCollectionViewCell.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 10/2/23.
//
import Foundation
import UIKit
import SnapKit
import Kingfisher

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: MenuCollectionViewCell.self)
    
    var roundingCorners = RoundCornerImageProcessor(cornerRadius: 200)
    
    let navVC = UINavigationController(rootViewController: BuyNowViewController())
//
    var buyNowIdentifier = "openView"
    
    var imagesOfProduct: UIImageView = {
        let image = UIImageView()
        image.image = UIImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    
    var productLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fried Rice"
        label.font = UIFont(name: "Avenir", size: 17)
        return label
    }()
    
    var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buy now", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 10, weight: .semibold)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(cgColor: CGColor(red: 250/265,
                                                          green: 120/265,
                                                          blue: 91/265,
                                                          alpha: 1))
        button.layer.shadowOffset = CGSize(width: 0.0, height: 5)
        button.layer.shadowOpacity = 0.2
//        button.addTarget(UIButton.self, action: #selector(openDish), for: .touchUpInside)
        button.addTarget(self, action: #selector(ViewController.openDish), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupSubviews()
        
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    
    private func setupSubviews() {
        self.backgroundColor = UIColor(cgColor: CGColor(
                                           red: 265/265,
                                         green: 245/265,
                                          blue: 240/265,
                                         alpha: 1))
        self.addSubview(imagesOfProduct)
        imagesOfProduct.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(10)
            make.width.height.equalTo(140)
        }
        
        
        
        self.addSubview(productLabel)
        productLabel.snp.makeConstraints{ make in
            make.top.equalTo(imagesOfProduct.snp.bottom)
            make.centerX.equalTo(imagesOfProduct)
            make.width.equalTo(80)
            make.height.equalTo(25)
        }
        
        self.addSubview(buyButton)
        buyButton.snp.makeConstraints { make in
            make.top.equalTo(productLabel.snp.bottom).offset(5)
            make.centerX.equalTo(productLabel)
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
        func displayInfo(product: Drinks){
            productLabel.text = product.strDrink
            imagesOfProduct.kf.setImage(with: URL(string: product.strDrinkThumb),
                                               options: [.processor(roundingCorners)])
    }
    
    
}
