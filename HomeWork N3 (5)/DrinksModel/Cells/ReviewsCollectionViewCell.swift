//
//  ReviewsCollectionViewCell.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 20/2/23.
//

import Foundation
import SnapKit
import UIKit
import Kingfisher

class ReviewsCollectionViewCell: UICollectionViewCell {


   
    
    static var reuseID = "ReviewsCollectionViewCell"
    
    

    private let personName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Avenir Heavy", size: 12)
        label.textColor = .black
        return label
    }()

    
    
    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir",size: 5)
        label.textColor = .black
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    
    private let borderLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        return view
    }()
    
    
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupReviewcCellUI()
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
            private func setupReviewcCellUI() {
               
                
                self.addSubview(borderLineView)
                borderLineView.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(30)
                    make.centerX.equalToSuperview()
                    make.width.equalToSuperview().offset(-10)
                    make.width.equalTo(100)
                    make.height.equalTo(3)
                }

                self.addSubview(personName)
                personName.snp.makeConstraints{ make in
                    make.top.equalTo(borderLineView.snp.bottom).offset(15)
                    make.right.equalToSuperview().offset(-20)
                }

                self.addSubview(commentLabel)
                commentLabel.snp.makeConstraints { make in
                    make.top.equalTo(personName.snp.bottom).offset(5)
                    make.width.equalToSuperview().offset(-40)
                    make.right.equalToSuperview().offset(-20)
                   
                }
                
              
            }

    
    
func displayInfo(product:ABC) {
    personName.text = product.name
    commentLabel.text = product.comment
    }
}
