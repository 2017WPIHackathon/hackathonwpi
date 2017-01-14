//
//  MeatViewController.swift
//  memuDemo
//
//  Created by Yen-Chang Hsieh on 1/14/17.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class MeatViewController: UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var menu: UIBarButtonItem!
    @IBOutlet weak var tblView: UITableView!
    
    var ManuNameArray:Array = [String]()
    var iconArray:Array = [UIImage]()
    
    var selectedMeat = [String : Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblView.allowsMultipleSelection = true
        
        ManuNameArray = ["beaf","pork"]
        iconArray = [UIImage(named:"meat")!,UIImage(named:"vegetable")!]
        
        for str in ManuNameArray {
            selectedMeat[str] = false
        }
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeatCell", for: indexPath) as! MeatCell
        
        cell.lblView.text! = ManuNameArray[indexPath.row]
        cell.imgView.image = iconArray[indexPath.row]

        cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.selectionStyle = .none // to prevent cells from being "highlighted"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        let cell:MeatCell = tableView.cellForRow(at: indexPath) as! MeatCell
        
        if cell.isSelected {
            cell.isSelected = false
            if cell.accessoryType == UITableViewCellAccessoryType.none {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                selectedMeat[cell.lblView.text!] = true
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
                selectedMeat[cell.lblView.text!] = false
            }
        }
    }
    
    @IBAction func action(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "toVegetable", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toVegetable" {
            var vegetableViewController = segue.destination as! VegetableViewController;
            
            for str in selectedMeat.keys {
                if selectedMeat[str]! {
                    vegetableViewController.selectedIngre.append(str)
                }
            }
        }
    }
}
