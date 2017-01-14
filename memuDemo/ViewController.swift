//
//  ViewController.swift
//  memuDemo
//
//  Created by Yen-Chang Hsieh on 1/14/17.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnMenuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            btnMenuButton.target = revealViewController()
            btnMenuButton.action = "revealToggle:"
            
            //            revealViewController().rightViewRevealWidth = 150
            //            extraButton.target = revealViewController()
            //            extraButton.action = "rightRevealToggle:"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
