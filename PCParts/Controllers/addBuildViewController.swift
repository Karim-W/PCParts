//
//  addBuildViewController.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import UIKit

class addBuildViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
//MARK:collectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabs.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width-10)/2, height: (UIScreen.main.bounds.height-45)/3)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(tabs[indexPath.row])
        print("hello")
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let t = indexPath.row % 2
        if (t == 0){
            leftC = 18
            rightC = 0
        }else{
            leftC = 0
            rightC = -18
        }
        let cell = components.dequeueReusableCell(withReuseIdentifier: "GFX", for: indexPath) as! componentCell
        setPannelColor(cell, tabs[indexPath.row])
        cell.titleLbl.text = tabs[indexPath.row]
        return cell
    }
    

    //MARK:Vars
    var components : UICollectionView!
    var tabs = ["CPU","Motherboard","RAM","Storage","GPU","Cooler","Power Supply","Accessories"]
    var cpu = CPU(NAME: "n/a", CORENUMBER: 0, FREQUENCY: 0)
    var mobo = MoBo()
    var ram = [RAM]()
    var storage = [Storage]()
    var gpu = [GPU]()
    var psu = PSU()
    var accessories = [Accessories]()
    var cpuSwitch = String()
    var gpuSwitch :String?
    var ramRGB = true
    
    //MARK:Setups
    override func viewDidLoad() {
        //navigationController?.add
        super.viewDidLoad()
        pannelInializers()
        setupCV()
        
        //view.backgroundColor = UIColor.purple
        // Do any additional setup after loading the view.
    }
    
    func setupCV(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        components = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        components.translatesAutoresizingMaskIntoConstraints = false
        components.register(componentCell.self, forCellWithReuseIdentifier: "GFX")
        components.delegate = self
        components.dataSource = self
        components.setCollectionViewLayout(layout, animated: true)
        view.addSubview(components)
        NSLayoutConstraint.activate([
            components.topAnchor.constraint(equalTo: view.topAnchor),
            components.leftAnchor.constraint(equalTo: view.leftAnchor),
            components.rightAnchor.constraint(equalTo: view.rightAnchor),
            components.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -40)
        ])
        components.backgroundColor = UIColor.systemBackground
    }
    //MARK:Handlers
    func setPannelColor(_ cell:componentCell,_ which:String){
        switch which {
        case "CPU":
            if (cpuSwitch.contains("amd")){
                cell.pannel.backgroundColor = UIColor.red
            }else if (cpuSwitch.contains("intel")){
                cell.pannel.backgroundColor = UIColor.systemBlue
            }else{
                cell.pannel.backgroundColor = UIColor.systemOrange
            }
        case "Motherboard":
            cell.pannel.backgroundColor = UIColor.systemIndigo
            break
        case "RAM":
            if (ramRGB == false){
                cell.pannel.backgroundColor = UIColor.systemOrange
            }else{
                cell.RGBview.isHidden = false
            }
            break
        case "Storage":
            cell.pannel.backgroundColor = UIColor.init(rgb: 0x8C1C13)//8C1C13
            break
        case "Power Supply":
            cell.pannel.backgroundColor = UIColor.init(rgb: 0xF96E46)//00E8FC
            break
        case "Cooler":
            cell.pannel.backgroundColor = UIColor.init(rgb: 0x00E8FC)//00E8FC
            break
        case "Accessories":
            cell.pannel.backgroundColor = UIColor.init(rgb: 0x0D0165)
            break
        default:
            cell.pannel.backgroundColor = UIColor.darkGray
        }
    }
    
    
    //MARK:Functions
    func pannelInializers(){
        cpuSwitch = cpu.Name.lowercased()
        if (gpu.count == 0) {
            gpuSwitch = "n/a"
        }else{gpuSwitch = gpu[0].name}
    }
//    func getDescription(_ which:String) -> String {
//        switch which {
//        case "CPU":
//
//        default:
//            <#code#>
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK: Extentions
func getColorFromHex(_ hex:String){
    
}
extension UIColor {
   convenience init(red: Int, green: Int, blue: Int) {
       assert(red >= 0 && red <= 255, "Invalid red component")
       assert(green >= 0 && green <= 255, "Invalid green component")
       assert(blue >= 0 && blue <= 255, "Invalid blue component")

       self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
   }
   convenience init(rgb: Int) {
       self.init(
           red: (rgb >> 16) & 0xFF,
           green: (rgb >> 8) & 0xFF,
           blue: rgb & 0xFF
       )
   }
}



extension componentCell {
     
    func odd(yes:Int){
        //print(yes)
        if (yes==0){
            leftC = 18
            rightC = 0
        }else{
            leftC = 0
            rightC = -18
        }
    }
    
}
