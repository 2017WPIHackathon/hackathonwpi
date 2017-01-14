//
//  VegetableViewController.swift
//  memuDemo
//
//  Created by Yen-Chang Hsieh on 1/14/17.
//  Copyright © 2017 Parth Changela. All rights reserved.
//



import UIKit

class VegetableViewController: UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var menu: UIBarButtonItem!
    
    @IBOutlet weak var tblView: UITableView!
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ManuNameArray = ["aaa","bbb"]
        iconArray = [UIImage(named:"meat")!,UIImage(named:"vegetable")!]
        
        // Do any additional setup after loading the view.
        revealViewController().rearViewRevealWidth = 200
        menu.target = revealViewController()
        menu.action = #selector(SWRevealViewController.revealToggle(_:))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ManuNameArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VegetableCell", for: indexPath) as! VegetableCell
        
        cell.lblView.text! = ManuNameArray[indexPath.row]
        cell.imgView.image = iconArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        
        let cell:VegetableCell = tableView.cellForRow(at: indexPath) as! VegetableCell
        print(cell.lblView.text!)
        if cell.lblView.text! == "aaa" {
            print("aaa Tapped")
        }
        
        if cell.lblView.text! == "bbb" {
            print("bbb Tapped")
            
        }
    }
}
