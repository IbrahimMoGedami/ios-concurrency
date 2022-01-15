//
//  ViewController.swift
//  ConcurrencyDemo
//
//  Created by Ibrahim Mo Gedami on 13/01/2022.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var lableText : UILabel!
    private let viewModel = ViewModel()
    private var cancellable = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadData()
        //MARK: 2nd solve is to use receive
        viewModel.$todo.receive(on: DispatchQueue.main).sink{[weak self] todo in
            guard let mySelf = self else { return  }
            mySelf.lableText.text = todo?.title
       //  MARK: 1st solve is to use DispatchQueue.main.async
//            DispatchQueue.main.async{
//                mySelf.lableText.text = todo?.title
//            }
        }
        .store(in:&cancellable)
    }
    
    

