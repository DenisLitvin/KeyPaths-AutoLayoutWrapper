//
//  ViewController.swift
//  KeyPaths AutoLayoutWrapper
//
//  Created by Litvin, Denis [GCB-OT] on 11/1/18.
//  Copyright © 2018 Litvin, Denis [GCB-OT]. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView()
        
        view.addSubview(view, constraints:[
            equal(\.centerYAnchor, \.bottomAnchor),
            equal(\.leftAnchor, constant: 10), equal(\.rightAnchor, constant: -10),
            equal(\.heightAnchor, constant: 100)
            ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

