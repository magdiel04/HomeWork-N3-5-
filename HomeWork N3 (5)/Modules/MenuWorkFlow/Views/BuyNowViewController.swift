//
//  BuyNowViewController.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 17/2/23.
//

import Foundation
import UIKit
import SnapKit


import UIKit
import SnapKit
class BuyNowViewController: UIViewController {
    
    
    private let centerPointOfScreen = UIView()
    
    var ratedPeople = [ABC(name: "Adolf Hitler", comment: """
                             SelectProductViewController.swift
                             3HomeWork
                           
                             Created by Altynbekov Magdiel on 17/2/23.
                           """),ABC(name: "stalin", comment: "privet")]
    
    
    private let backToMenuButton: UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Chalkboard SE Regular", size: 40)
        button.titleLabel?.textAlignment = .center
        button.layer.shadowOffset = .init(width: 1, height: 4)
        button.layer.shadowOpacity = 0.6
        button.addTarget(self, action: #selector(backTap), for: .touchUpInside)
        return button
    }()
    
        private let discountedLabel: UILabel = {
        let label = UILabel()
        label.text = "Discounted"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir Heavy", size: 16)
        label.layer.cornerRadius = 18
        label.clipsToBounds = true
        label.backgroundColor = .gray
        label.alpha = 0.86
        return label
    }()
    
    
    private let selectedProductImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "test")
        return image
    }()
    
    
    private let ratingButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 27
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 3, height: 5)
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    
    private let ratedPeopleFIrstImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.image = UIImage(systemName: "person")
        image.backgroundColor = .red
        return image
    }()
    
    
    private let ratedPeopleSecondImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.image = UIImage(systemName: "person")
        image.backgroundColor = .green
        return image
    }()
    
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "4.5"
        label.font = UIFont(name: "Avenir", size: 16)
        return label
    }()
    
    
    private let ratingStarImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = .systemOrange
        image.clipsToBounds = true
      
        return image
    }()
    
    
    private let descriptView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 50
        view.backgroundColor = UIColor(cgColor:CGColor(
                                           red: 265/265,
                                         green: 245/265,
                                          blue: 240/265,
                                         alpha: 1))
        return view
    }()
    
    
    private let descriptLargeLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont(name: "Avenir Heavy", size: 20)
        label.numberOfLines = 0
        return label
    }()
    
    
    private let descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 12)
        label.numberOfLines = 0
        label.text = """
My tea's gone cold, I'm wondering why I
Got out of bed at all
The morning rain clouds up my window
And I can't see at all…
"""
        return label
    }()
    
    
    
    
    
    private let reviewsCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 170, height: 150)
        flowLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
   
    private func setupCollectionView() {
        reviewsCollectionView.dataSource = self
        reviewsCollectionView.delegate = self
        reviewsCollectionView.register(ReviewsCollectionViewCell.self,
                                    forCellWithReuseIdentifier: ReviewsCollectionViewCell.reuseID)
    }
    
    private let basketAddingView:UIView = {
        let view = UIView()
         view.backgroundColor = UIColor(cgColor: CGColor(
            red: 265/265,
          green: 100/265,
           blue: 71/265,
          alpha: 1))
         view.layer.cornerRadius = 23
         view.layer.shadowColor = UIColor.black.cgColor
         view.layer.shadowOffset = CGSize(width: 3, height: 5)
         view.layer.shadowOpacity = 0.4
         return view
    }()
    
    private let productCountLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Avenir Heavy", size: 16)
        label.layer.borderColor = UIColor.white.cgColor
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 15
        return label
    }()
    
    
    private let plusProductButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 22)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .right
        button.addTarget(self, action: #selector(plusOneThing), for: .touchUpInside)
        return button
    }()
    
    
    private let minusProductButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Heavy", size: 30)
        button.titleLabel?.textColor = .white
        button.titleLabel?.textAlignment = .left
        button.addTarget(self, action: #selector(minususOneThing), for: .touchUpInside)
        return button
    }()
    
    
    private let addToBusketButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "basket.fill"), for: .normal)
        button.tintColor = .black
        button.backgroundColor = .white
        button.layer.cornerRadius = 22.5
        button.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 2, height: 4)
        button.layer.shadowOpacity = 0.4
        return button
    }()
    
    
    private let priceOfProductLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Heavy", size: 20)
        label.text = "300"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    setupSelectedProductUI()
        setupCollectionView()
    }
    
    
    func setupSelectedProductUI(){
        
        
        view.addSubview(centerPointOfScreen)
        centerPointOfScreen.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(1)
        }
        
        
        view.addSubview(selectedProductImage)
        selectedProductImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-110)
            make.width.equalToSuperview().offset(100)
            make.bottom.equalTo(centerPointOfScreen).offset(100)
        }
        
        
        view.addSubview(backToMenuButton)
        backToMenuButton.snp.makeConstraints { make
            in
                        make.top.equalToSuperview().offset(70)
                        make.left.equalToSuperview().offset(30)
                    }
                    
                    
                    view.addSubview(discountedLabel)
                    discountedLabel.snp.makeConstraints { make in
                        make.centerY.equalTo(backToMenuButton).offset(10)
                        make.right.equalToSuperview().offset(-30)
                        make.width.equalTo(120)
                        make.height.equalTo(35)
                    }
                    
                    
                    view.addSubview(descriptView)
                    descriptView.snp.makeConstraints { make in
                        make.top.equalTo(centerPointOfScreen.snp.top)
                        make.bottom.equalToSuperview().offset(30)
                        make.width.equalToSuperview()
                    }
                    
                    
                    view.addSubview(ratingButton)
                    ratingButton.snp.makeConstraints { make in
                        make.centerY.equalToSuperview()
                        make.width.equalTo(170)
                        make.height.equalTo(50)
                        make.left.equalToSuperview().offset(30)
                    }
                    
                    
                    view.addSubview(ratedPeopleSecondImage)
                    ratedPeopleSecondImage.snp.makeConstraints { make in
                        make.width.height.equalTo(ratingButton.snp.height).offset(-10)
                        make.centerY.equalTo(ratingButton.snp.centerY)
                        make.left.equalTo(ratingButton.snp.left).offset(40)
                    }
                    
                    
                    view.addSubview(ratedPeopleFIrstImage)
                    ratedPeopleFIrstImage.snp.makeConstraints { make in
                        make.width.height.equalTo(ratingButton.snp.height).offset(-10)
                        make.centerY.equalTo(ratingButton.snp.centerY)
                        make.left.equalTo(ratingButton.snp.left).offset(10)
                    }
                    
                    
                    view.addSubview(ratingStarImage)
                    ratingStarImage.snp.makeConstraints { make in
                        make.centerY.equalTo(ratingButton.snp.centerY)
                        make.right.equalTo(ratingButton.snp.right).offset(-10)
                    }
                    
                    
                    view.addSubview(ratingLabel)
                    ratingLabel.snp.makeConstraints { make in
                        make.centerY.equalTo(ratingButton.snp.centerY)
                        make.right.equalTo(ratingStarImage.snp.left).offset(-10)
                    }
                    
                    
                    view.addSubview(descriptLargeLabel)
                    descriptLargeLabel.snp.makeConstraints { make in
                        make.top.equalTo(ratingButton.snp.bottom).offset(25)
                        make.left.equalTo(descriptView.snp.left).offset(30)
                        make.width.equalTo(ratingButton.snp.width).offset(-20)
                    }
                    
                    
                    view.addSubview(descriptionTextLabel)
                    descriptionTextLabel.snp.makeConstraints { make in
                        make.top.equalTo(descriptLargeLabel.snp.bottom).offset(20)
                        make.width.equalTo(descriptLargeLabel.snp.width)
                        make.left.equalTo(descriptView.snp.left).offset(30)
                    }
                    
                    
                    view.addSubview(reviewsCollectionView)
                    reviewsCollectionView.snp.makeConstraints { make in
                        make.top.equalTo(descriptLargeLabel.snp.top)
                        make.left.equalTo(descriptLargeLabel.snp.right).offset(50)
                        make.width.height.equalTo(descriptLargeLabel.snp.width)
                        make.bottom.equalTo(descriptionTextLabel.snp.bottom)
                    }
                    
                    
                    view.addSubview(reviewsCollectionView)
                    reviewsCollectionView.snp.makeConstraints { make in
                        make.top.equalTo(descriptLargeLabel.snp.top)
                        make.left.equalTo(descriptLargeLabel.snp.right).offset(50)
                        make.width.height.equalTo(descriptLargeLabel.snp.width)
                        make.bottom.equalTo(descriptionTextLabel.snp.bottom)
                    }
                    
                    
                    view.addSubview(basketAddingView)
                    basketAddingView.snp.makeConstraints { make in
                        make.centerX.equalToSuperview()
                        make.width.equalToSuperview().offset(-100)
                        make.height.equalTo(60)
                        make.bottom.equalToSuperview().offset(-110)
                    }
                    
                    
                    view.addSubview(productCountLabel)
                    productCountLabel.snp.makeConstraints { make in
                        make.center.equalTo(basketAddingView.snp.center)
                        make.width.equalTo(basketAddingView.snp.width).offset(-180)
                        make.height.equalTo(basketAddingView.snp.height).offset(-20)
                                }
                    
                    
                    view.addSubview(plusProductButton)
                    plusProductButton.snp.makeConstraints { make in
                        make.centerY.equalTo(basketAddingView.snp.centerY)
                        make.width.height.equalTo(basketAddingView.snp.height).offset(-15)
                        make.right.equalTo(productCountLabel.snp.right).offset(-2)
                    }
                    
                    
                    view.addSubview(minusProductButton)
                    minusProductButton.snp.makeConstraints { make in
                        make.centerY.equalTo(basketAddingView.snp.centerY)
                        make.width.height.equalTo(basketAddingView.snp.height).offset(-15)
                        make.left.equalTo(productCountLabel.snp.left).offset(2)
                    }
                    
                    
                    view.addSubview(addToBusketButton)
                    addToBusketButton.snp.makeConstraints { make in
                        make.centerY.equalTo(basketAddingView.snp.centerY)
                        make.width.height.equalTo(basketAddingView.snp.height).offset(-15)
                        make.right.equalTo(basketAddingView.snp.right).offset(-15)
                    }
                    
                    
                    view.addSubview(priceOfProductLabel)
                    priceOfProductLabel.snp.makeConstraints { make in
                        make.centerY.equalTo(basketAddingView.snp.centerY)
                        make.right.equalTo(productCountLabel.snp.left).offset(-15)
                        make.left.equalTo(basketAddingView.snp.left).offset(15)
                      
                    }
                    
                    
                }
                
                
                
                
                @objc func plusOneThing(){
                    guard productCountLabel.text != "10" else{return}
                    productCountLabel.text = String(Int(productCountLabel.text!)! + 1)
                    priceOfProductLabel.text = String(Int(priceOfProductLabel.text!)! + Int(priceOfProductLabel.text!)! / (Int(productCountLabel.text!)! - 1))
                }
                
                @objc func minususOneThing(){
                    guard productCountLabel.text != "1" else{return}
                    productCountLabel.text = String(Int(productCountLabel.text!)! - 1)
                    priceOfProductLabel.text = String(Int(priceOfProductLabel.text!)! - Int(priceOfProductLabel.text!)! / (Int(productCountLabel.text!)! + 1))
                }
                
    @objc func backTap(){
        let back = ViewController()
                navigationController?.pushViewController(back, animated: true)
    }
    
                @objc func addToBasket(){
                 
                    
                }
                
                
                
             
                    
            }


            extension BuyNowViewController: UICollectionViewDataSource,UICollectionViewDelegate{
                
                func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                    ratedPeople.count
                }
                
                func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewsCollectionViewCell.reuseID, for: indexPath) as? ReviewsCollectionViewCell else { fatalError() }
                    let product = ratedPeople[indexPath.row]
                    cell.displayInfo(product: product)
                    return cell
                }
               

            }


//class BuyNowViewController: UIViewController{
//    private var backButton: UIButton = {
//        let button = UIButton()
//        button.addTarget(self, action: #selector(backButtonTap), for: UIControl.Event.touchUpInside)
//        button.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
//        button.tintColor = .white
//        button.sizeThatFits(CGSize(width: 20, height: 50))
//        button.layer.shadowOffset = CGSize(width: 0.0, height: 5)
//        button.layer.shadowOpacity = 0.8
//        return button
//    }()
//
//    private var descriptionView: UIView = {
//        let view = UIView()
//        return view
//    }()
//
//    private var discountedLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Discounted"
//        label.backgroundColor = .gray
//        label.font = UIFont(name: "Hiragino Sans W6 ", size: 13)
//        label.textColor = .white
//        label.layer.cornerRadius = 15
//        label.alpha = 0.86
//        label.clipsToBounds = true
//        return label
//    }()
//
//    private var ratingLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }()
//
//    var isTapped: Bool = false
//
//    private func setupSubviews(){
//        view.addSubview(backButton)
//        backButton.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(100)
//            make.left.equalToSuperview().offset(30)
//        }
//        view.addSubview(discountedLabel)
//        discountedLabel.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(95)
//            make.right.equalToSuperview().offset(-40)
//            make.height.equalTo(35)
//            make.width.equalTo(112)
//        }
//        view.addSubview(descriptionView)
//        descriptionView.snp.makeConstraints { make in
//            make.bottom.equalToSuperview().offset(-10)
//            make.top.equalToSuperview().offset(430)
//        }
//    }
//
//
//
//    @objc func backButtonTap(){
//
//        let back = ViewController()
//        navigationController?.pushViewController(back, animated: true)
//    }
//
//    override func loadView() {
//        super.loadView()
//        setupSubviews()
//        view.backgroundColor = .init(
//            red: 265/265,
//            green: 245/265,
//            blue: 240/265,
//            alpha: 1)
//        navigationItem.hidesBackButton = true
//
//    }
//
//}
