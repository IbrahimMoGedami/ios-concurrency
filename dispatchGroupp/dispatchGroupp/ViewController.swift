//
//  ViewController.swift
//  dispatchGroupp
//
//  Created by Ebrahim  Mo Gedamy on 8/22/20.
//  Copyright © 2020 Ebrahim  Mo Gedamy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numbers : [TimeInterval] = [1,3,5,6,7,8]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //dispatchGroup()
        getData()
    }
    
    //MARK:- DispatchQueue
    func getData(){
        ///:-https://www.youtube.com/watch?v=hmu0v_25pgc
        
        guard let url = URL(string: "") else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            
            guard data != nil else { return }
            
            DispatchQueue.main.async {
                /// calling self here will cause memory retain cycle so use [weak self]
                self?.view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
            }
            
        }.resume()
    }
    
    
    //MARK:- DispatchGroup
    func dispatchGroup(){
        
        let group = DispatchGroup()
        
        for n in numbers{
            
            group.enter() // because the completion handeler in data task is async
            print("entering group with number \(n)")
            DispatchQueue.main.asyncAfter(deadline: .now() + n) {
                group.leave()
                print("leaving group with number \(n)")
            }
        }
        group.notify(queue: .main) {
            print("Done with all operations")
            self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
    }
    
}

