//
//  RootViewController.swift
//  EazyGCD
//
//  Created by Alex Nagy on 07/02/2019.
//  Copyright © 2019 Alex Nagy. All rights reserved.
//

import TinyConstraints

class RootViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Fetch data from server", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Waiting for result..."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(button)
        view.addSubview(label)
        
        button.centerInSuperview()
        label.topToSuperview(offset: 24, usingSafeArea: true)
        label.centerXToSuperview()
    }
    
    @objc fileprivate func buttonTapped() {
        grabDataFromDatabase()
    }
    
    func grabDataFromDatabase() {
        let result = 1
        let seconds = 3.0
//        DispatchQueue.global().async(qos: .background) {
//            let dispatchTime = DispatchTime.now() + seconds
//            DispatchQueue.global().asyncAfter(deadline: dispatchTime) {
//                DispatchQueue.main.async {
//                    self.label.text = "Result : \(result )"
//                }
//            }
//        }
        DispatchQueueHelper.delay(bySeconds: seconds, dispatchLevel: .background) {
            let dispatchTime = DispatchTime.now() + seconds
            DispatchQueue.global().asyncAfter(deadline: dispatchTime) {
                DispatchQueue.main.async {
                    self.label.text = "Result : \(result )"
                }
            }
        }
    }
    
}



