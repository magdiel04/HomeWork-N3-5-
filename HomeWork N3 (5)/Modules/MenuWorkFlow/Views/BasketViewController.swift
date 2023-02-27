//
//  BasketViewController.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 17/2/23.
//

import Foundation
import UIKit
import SnapKit

class BasketViewController: UIViewController{
   
    let borderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(cgColor: CGColor(
            red: 216/265,
            green: 216/265,
            blue: 225/265,
            alpha: 0.85))
        return view
    }()
    let profileTitle: UILabel = {
        let title = UILabel()
        title.text = "Basket"
        title.font = UIFont(name: "Avenir Heavy", size: 33)
        title.textAlignment = .left
        return title
    }()
    
    let images = [DEF(name: "1"),DEF(name: "1"),DEF(name: "1"),DEF(name: "1"),DEF(name: "1"),DEF(name: "1")]
    
    var productTableView: UITableView = {
       let table = UITableView()
        table.rowHeight = 80
        return table
    }()
    
    private func setupTableView(){
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.reuseIdentifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        setupTableView()
        setupTableUI()
    }
    
    
    func setupTableUI(){
      
        
        
        view.backgroundColor = .init(
            red: 265/265,
            green: 245/265,
            blue: 240/265,
            alpha: 1)
        
        view.addSubview(borderView)
        borderView.snp.makeConstraints{ make in
            make.height.equalTo(5)
            make.top.equalToSuperview().offset(150)
            make.trailing.equalToSuperview().inset(20)
            make.leading.equalToSuperview().offset(20)
        }
        view.addSubview(profileTitle)
        profileTitle.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(190)
            make.height.equalTo(40)
        }
        view.addSubview(productTableView)
        productTableView.snp.makeConstraints { make in
            make.top.equalTo(borderView.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(100)
        }
    }
   
    
}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(
            withIdentifier: BasketTableViewCell.reuseIdentifier,
            for: indexPath
        ) as? BasketTableViewCell else{ fatalError() }

        let product = images[indexPath.row]
        cell.display(item: product)
        print(images[indexPath.row])
        return cell
    }





    }

    

