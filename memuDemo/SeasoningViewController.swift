//
//  SeasoningViewController.swift
//  memuDemo
//
//  Created by Yen-Chang Hsieh on 1/14/17.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class SeasoningViewController: UIViewController {
    @IBOutlet weak var menu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        revealViewController().rearViewRevealWidth = 200
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
