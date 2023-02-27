//
//  ProfileView.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 10/2/23.
//

import Foundation
import UIKit
import SnapKit

class ProfileViewController: UIViewController {
        
        let profileTitle: UILabel = {
            let title = UILabel()
            title.text = "Profile"
            title.font = UIFont(name: "Avenir Heavy", size: 33)
            return title
        }()
        
        let borderView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(cgColor: CGColor(
                red: 216/265,
                green: 216/265,
                blue: 225/265,
                alpha: 0.85))
            return view
        }()
        
        let profileImage: UIImageView = {
            let image = UIImageView()
            image.layer.cornerRadius = image.frame.width/2
            image.image = UIImage(systemName: "person.circle.fill")
            image.tintColor = UIColor(cgColor: CGColor(
                red: 216/265,
                green: 216/265,
                blue: 225/265,
                alpha: 0.85))
            return image
        }()
        
        let usernameLabel: UILabel = {
            let usernameLabel = UILabel()
            usernameLabel.text = "Magdiel"
            usernameLabel.font = UIFont(name: "Avenir", size: 20)
            usernameLabel.numberOfLines = 1
            return usernameLabel
        }()
        
        let emailInformation: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Email:"
            textField.font = UIFont(name: "Avenir Next", size: 16)
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(cgColor:CGColor(
                red: 265/265,
                green: 245/265,
                blue: 240/265,
                alpha: 1))
            textField.isUserInteractionEnabled = true
            return textField
        }()
        
        let dateOfBirthInfo: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Date Of Birth:"
            textField.font = UIFont(name: "Avenir Next", size: 16)
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(cgColor:CGColor(
                red: 265/265,
                green: 245/265,
                blue: 240/265,
                alpha: 1))
            textField.isUserInteractionEnabled = true
            return textField
        }()
        
        let addressInfo: UITextField = {
            let textField = UITextField()
            textField.placeholder = "Addres:"
            textField.font = UIFont(name: "Avenir Next", size: 16)
            textField.borderStyle = .roundedRect
            textField.backgroundColor = UIColor(cgColor:CGColor(
                red: 265/265,
                green: 245/265,
                blue: 240/265,
                alpha: 1))
            textField.isUserInteractionEnabled = true
            return textField
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor(cgColor:CGColor(
                red: 265/265,
                green: 245/265,
                blue: 240/265,
                alpha: 1))
            setupUI()
        }
        
        
        private func setupUI() {
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
                make.width.equalTo(100)
                make.height.equalTo(40)
            }
            
            view.addSubview(profileImage)
            profileImage.snp.makeConstraints{ make in
                make.top.equalTo(borderView.snp.bottom).offset(50)
                make.left.equalToSuperview().offset(30)
                make.width.height.equalTo(188)
            }
            
            view.addSubview(usernameLabel)
            usernameLabel.snp.makeConstraints{ make in
                make.top.equalTo(borderView).offset(110)
                make.left.equalTo(profileImage.snp.right).offset(15)
                make.width.equalTo(115)
                make.height.equalTo(110)
            }
            
            view.addSubview(emailInformation)
            emailInformation.snp.makeConstraints{ make in
                make.top.equalTo(usernameLabel.snp.bottom).offset(65)
                make.left.equalToSuperview().offset(30)
                make.width.equalTo(310)
                make.height.equalTo(45)
            }
            
            view.addSubview(dateOfBirthInfo)
            dateOfBirthInfo.snp.makeConstraints{ make in
                make.top.equalTo(emailInformation.snp.bottom).offset(25)
                make.left.equalToSuperview().offset(30)
                make.width.equalTo(310)
                make.height.equalTo(45)
            }
            
            view.addSubview(addressInfo)
            addressInfo.snp.makeConstraints{ make in
                make.top.equalTo(dateOfBirthInfo.snp.bottom).offset(25)
                make.left.equalToSuperview().offset(30)
                make.width.equalTo(310)
                make.height.equalTo(110)
            }
        }
        
    }

