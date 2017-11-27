//
//  ViewController.swift
//  GenericsSwift
//
//  Created by Ildar Zalyalov on 27.11.2017.
//  Copyright © 2017 Ildar Zalyalov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var costDelegate: CostProtocol!
    
    typealias Class = ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        costDelegate = CostProtocolImplementation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

