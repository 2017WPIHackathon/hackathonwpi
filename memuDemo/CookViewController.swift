//
//  CookViewController.swift
//  memuDemo
//
//  Created by Yen-Chang Hsieh on 1/14/17.
//  Copyright © 2017 Parth Changela. All rights reserved.
//

import UIKit

var DishList: [String:Dish] = [String: Dish]()
var meatComponentsList : Array<String> = ["pork",
                                          "beef",
                                          "chicken",
                                          "turkey",
                                          "lamb",
                                          "rabbit",
                                          "duck",
                                          "seafood",
]

var vegaComponentsList : Array<String> = [  "artichoke",
                                            "asparagus",
                                            "cabbage",
                                            "carrot",
                                            "cauliflower",
                                            "celery",
                                            "corn",
                                            "cucumber",
                                            "egg",
                                            "eggplant",
]

class CookViewController: UIViewController {

    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishPic: UIImageView!
    @IBOutlet weak var dishIngredient: UILabel!
    
    @IBOutlet weak var dishInstruction: UITextView!
    
    
    var selectedIngre:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Cookview tapped")

        // Do any additional setup after loading the view.
        
        //1 获取json文件路径
        let path=Bundle.main.path(forResource: "try", ofType: "json")
        //2 获取json文件里面的内容,NSData格式
        let jsonData=try? Data(contentsOf: URL(fileURLWithPath: path!))
        
        //3 解析json内容
        do{
            let json = try JSONSerialization.jsonObject(with: jsonData!, options:[]) as! [String:AnyObject]
            // b 解析  "protocol" 的所有内容
            if let provinces = json["protocol"] as? NSArray {//因为province的类型是数组[]
                // print("一共有\(provinces.count)个省")
                for province in provinces as! [[String:Any]]{
                    var temp : Dish = Dish()
                    
                    let name=province["name"] as! String//因为province中name的类型是字符串String
                    temp.name=name
                    // print(temp.name)
                    let category=province["category"] as! String
                    temp.category=category
                    
                    let image = province["image"] as! String
                    //let imagepath = Bundle.main.path(forResource: image, ofType: "jpg")
                    //let newImage = UIImage(contentsOfFile: imagepath!)!
                    //let newImage = UIImage(named: image, in: Bundle(for: self), compatibleWith: nil)
                    let newImage = UIImage(named: image, in: Bundle(identifier: "parth.memuDemo"), compatibleWith: nil)

                    temp.image = newImage!
                    if let integradient=province["integradient"] as? NSArray{//因为province中cities的类型是字典{}
                        //print("\(name)'s ingrediant are")
                        for cityname in integradient {
                            temp.componentListInDish.append(cityname as! String)
                            //print("\(cityname)")
                        }
                    }
                    if let instruction=province["instruction"] as? NSArray{//因为province中cities的类型是字典{}
                        //print("\(name)'s ingrediant are")
                        for item in instruction {
                            temp.instructionList.append(item as! String)
                            //print("\(item)")
                        }
                    }
                    
                    DishList[temp.name] = temp
                }
            }
        } catch let error as NSError{
            print("解析出错: \(error.localizedDescription)")
        }
        
        let dishSet = Array(DishList.keys)
        dishName.text! = dishSet[0]
        dishPic.image = DishList[dishSet[0]]!.image
        
        var ingreStr:String = String()
        for str in (DishList[dishSet[0]]?.componentListInDish)! {
            ingreStr.append(str + ", ")
        }
        
        dishIngredient.text! = ingreStr
        
        var instructionStr:String = String()
        for str in (DishList[dishSet[0]]?.instructionList)! {
            instructionStr.append(str + "\n")
        }
        dishInstruction.text! = instructionStr
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
