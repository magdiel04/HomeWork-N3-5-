//
//  BasketTableViewCell.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 18/2/23.
//

import UIKit
import SnapKit
import Kingfisher
import Foundation

class BasketTableViewCell: UITableViewCell {
    
   static let reuseIdentifier = "BasketTableViewCell"
    
    
//
//    var roundingCorners = RoundCornerImageProcessor(cornerRadius: 10)
    
//    var basketImage: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFit
//        image.layer.cornerRadius = 5
//        image.clipsToBounds = true
//        return image
//    }()
//
    var tableViewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.backgroundColor = .red
        label.textColor = .white
        return label
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
               super.setSelected(selected, animated: false)
               setupView()
               
           }
    
         
    
    
    func setupView(){
        self.backgroundColor = UIColor(cgColor: CGColor(
                                           red: 265/265,
                                         green: 245/265,
                                          blue: 240/265,
                                         alpha: 1))
//        self.addSubview(basketImage)
//        basketImage.snp.makeConstraints { make in
//
//            make.width.height.equalTo(80)
//            make.left.equalToSuperview().offset(-10)
//            make.centerY.equalToSuperview()
//        }
        self.addSubview(tableViewLabel)
        tableViewLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        
    }
   
    
    func display(item: DEF) {
        tableViewLabel.text = item.name
    }
}
