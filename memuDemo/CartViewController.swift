//
//  CartViewController.swift
//  memuDemo
//
//  Created by Yen-Chang Hsieh on 1/14/17.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

class CartViewController: UIViewController,UINavigationBarDelegate,UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var menu: UIBarButtonItem!
    
    @IBOutlet weak var tblView: UITableView!
    
    var seletedCount: Int = 0
    var selectedIngre = [String]()
    
    
    @IBAction func action(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "Cook", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Cook" {
            var cookViewController = segue.destination as! CookViewController;
            
            for str in selectedIngre {
                cookViewController.selectedIngre.append(str)
            }
        }
    }
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedIngre.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        
        cell.lblView.text! = selectedIngre[indexPath.row]
        //cell.imgView.image = selectedIngre[keyArray[indexPath.row]]
        cell.imgView.image = UIImage(named:"\(selectedIngre[indexPath.row])")
        
        cell.accessoryType = cell.isSelected ? .checkmark : .none
        cell.selectionStyle = .none // to prevent cells from being "highlighted"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let revealviewcontroller:SWRevealViewController = self.revealViewController()
        let cell:CartCell = tableView.cellForRow(at: indexPath) as! CartCell
    }
}
