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
    
    var selectedVeg = [String : Bool]()
    
    var selectedIngre = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ManuNameArray = ["cabbage","potato"]
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
        
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.selectionStyle = .none // to prevent cells from being "highlighted"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        let cell:VegetableCell = tableView.cellForRow(at: indexPath) as! VegetableCell
        
        if cell.isSelected {
            cell.isSelected = false
            if cell.accessoryType == UITableViewCellAccessoryType.none {
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                selectedVeg[cell.lblView.text!] = true
            } else {
                cell.accessoryType = UITableViewCellAccessoryType.none
                selectedVeg[cell.lblView.text!] = false
            }
        }
    }
    
    @IBAction func action(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "toCart", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toCart" {
            var cartViewController = segue.destination as! CartViewController;
            
            for str in selectedVeg.keys {
                if selectedVeg[str]! {
                    cartViewController.selectedIngre.append(str)
                }
            }
            
            for str in selectedIngre {
                cartViewController.selectedIngre.append(str)
            }
        }
    }
}
