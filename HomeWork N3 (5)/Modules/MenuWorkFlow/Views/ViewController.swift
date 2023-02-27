//
//  ViewController.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 10/2/23.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    
    private var productArray = [Drinks]() {
        
        didSet {
            menuCollectionView.reloadData()
        }
    }
    
    var filterProduct:[Drinks] = []
    
    var isSearching = false
    
    private var mainDishesLabel: UILabel = {
        let label = UILabel()
        label.text = "Main Dishes"
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private var underLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.text = "Find the best selling dishes. All meals are preparred fresh."
        secondLabel.font = .systemFont(ofSize: 18, weight: .light)
        secondLabel.numberOfLines = 0
        secondLabel.textAlignment = .center
        secondLabel.textColor = .white
        return secondLabel
    }()
    
    private var searchBar: UISearchBar = {
        let searchMenu = UISearchBar()
        searchMenu.searchTextField.placeholder = "Search Menu"
        searchMenu.searchTextField.textAlignment = .center
        searchMenu.searchTextField.font = .systemFont(ofSize: 17, weight: .thin)
        searchMenu.layer.cornerRadius = 40
        return searchMenu
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.hidesWhenStopped = true
        return view
    }()
    
    private var isLoading: Bool = false {
        didSet{
            _ = isLoading
            ? activityIndicator.startAnimating()
            : activityIndicator.stopAnimating()
        }
    }

    private var menuCollectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.itemSize = CGSize(width: 180, height: 210)
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: viewLayout
        )
        collectionView.backgroundColor = .init(
            cgColor: CGColor(
                red: 265/265,
                green: 245/265,
                blue: 240/265,
                alpha: 1)
        )
        return collectionView
    }()
    
    private func setupMenuCollectionView(){
        self.menuCollectionView.dataSource = self
        self.menuCollectionView.register(
            MenuCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuCollectionViewCell.reuseIdentifier
        )
        self.searchBar.delegate = self
        
        //        private func searchProducts(by word: String) {
        //            isLoading = true
        //
        //            NetworkManager.shared.searchProducts(by: word) { result in
        //                self.isLoading = false
        //                switch result {
        //                case .success(let model):
        //                    self.productArray = model
        //                    DispatchQueue.main.async {
        //                        self.productTableView.reloadData()
        //                    }
        //                case .failure(let error):
        //                    self.showError(with: error)
        //                }
        //            }
        //
    }
    
    private func fetchCoctailsData()  {
        if !isLoading {
            isLoading = true
            Task {
                productArray = try await NetworkManager.shared.fetchData().drinks
                isLoading = false
            }
            
        }
    }
    
    private func setupSubviews(){
        view.backgroundColor = UIColor(cgColor: CGColor(
            red: 250/265,
            green: 120/265,
            blue: 91/265,
            alpha: 1)
        )
        view.addSubview(mainDishesLabel)
        mainDishesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        view.addSubview(underLabel)
        underLabel.snp.makeConstraints { make in
            make.top.equalTo(mainDishesLabel.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
            make.width.equalTo(284)
            make.height.equalTo(77)
        }
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(underLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        view.addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupMenuCollectionView()
        fetchCoctailsData()
        navigationItem.hidesBackButton = true
        
        
        
    }
//    @objc func intoProduct(){
//        let buyNowVC = BuyNowViewController()
//        navigationController?.pushViewController(buyNowVC, animated: true)
//    }
    
    @objc func openDish(){
        
        let buyVC = BuyNowViewController()
        navigationController?.pushViewController(buyVC, animated: true)
        
    }
}
    
    extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
        func collectionView(
            _ collectionView: UICollectionView,
            numberOfItemsInSection section: Int
        ) -> Int {
            if isSearching {
                return filterProduct.count
            }else{
                return productArray.count
            }
        }
        
        func collectionView(
            _ collectionView: UICollectionView,
            cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
            guard let cell = menuCollectionView.dequeueReusableCell(
                withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? MenuCollectionViewCell else{ fatalError() }
            
            if isSearching{
                let product = filterProduct[indexPath.row]
                cell.displayInfo(product: product)
            }else{
                let product = productArray[indexPath.row]
                cell.displayInfo(product: product)
            }
        
            return cell
        }
    }
    
extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterProduct.removeAll()
        
        
        
        
        let filteredItems = productArray.filter { $0.strDrink.lowercased().contains(searchText.lowercased()) }
               
        
        
        filterProduct = filteredItems

        if searchBar.text == ""{
            isSearching = false
            menuCollectionView.reloadData()
        }else{
            isSearching = true

            menuCollectionView.reloadData()
        }
    }
}
