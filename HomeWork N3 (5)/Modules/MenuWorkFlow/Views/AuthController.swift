//
//  FireBaseViewController.swift
//  HomeWork N3 (5)
//
//  Created by Magdiel Altynbekov on 19/2/23.
//
import UIKit
import SnapKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AuthController: UIViewController{
    
    private let phoneNumber = "+996502041204"
    
    private var verificationId: String?
    
    private let collection = "Geeks"
    private let document = "Students"
    
    private var authTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Cod"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.backgroundColor = .init(
            cgColor: CGColor(
                red: 265/265,
                green: 245/265,
                blue: 240/265,
                alpha: 1)
        )
        return textField
    }()
    
    private var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.clipsToBounds = true
        button.backgroundColor = UIColor(cgColor: CGColor(
            red: 250/265,
            green: 120/265,
            blue: 91/265,
            alpha: 1)
        )
        button.addTarget(self, action: #selector(openHeadView), for: .touchUpInside)
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAuth()
        view.backgroundColor = .black
        DatabaseManager.shared.setTo(collection: collection, document: document, withData: ["Lesson" : 7])
        authentificateWithPN()
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        DatabaseManager.shared.readFrom(collection: collection, document: document)
        
    }
    
    private func authentificateWithPN(){
        
        PhoneAuthProvider.provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                self.verificationId = verificationID
                // Sign in using the verificationID and the code sent to the user
                // ...
            }
        
    }
    private func verifyPhoneAuth(){
        guard let code = authTextField.text,
              let vId = verificationId else {
            return
            
        }
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: vId,
            verificationCode: code
        )
        authInApp(with: credential)
    }
    
    @objc func openHeadView(){
        let homeVC = ViewController()
        navigationController?.pushViewController(homeVC, animated: true)
//        verifyPhoneAuth()
    }

    
    private func authInApp(with credential: PhoneAuthCredential){
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                let homeVC = ViewController()
                self.navigationController?.pushViewController(homeVC, animated: true)
                print("Error is: \(error.localizedDescription)")
            }else{
                
                print("Authorized: \(authResult?.user)")
            }
            // User is signed in
            // ...
        }
    }
    
    
    
    func setupAuth(){
        view.addSubview(authTextField)
        authTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(authTextField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(35)
            make.width.equalTo(100)
        }
    }
}
    
    
    
    
        

