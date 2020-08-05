//
//  BuilderViewController.swift
//  PCParts
//
//  Created by Karim Wael on 7/30/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import UIKit
//Gloabal variable
var builds = [Build]()


class BuilderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return builds.count
        //return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = buildTable.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! buildCell
        cell.selectionStyle = .none
        cell.layer.borderWidth = 4
        cell.layer.borderColor = UIColor.systemBackground.cgColor
        //print(builds[indexPath.row].CPU?.Name)
        //cell.imageView?.backgroundColor = UIColor.systemRed
        cell.CPUName.text = builds[indexPath.row].cpu!.Name
        cell.cores.text = String(builds[indexPath.row].cpu!.coreNum) + " Cores" + " @ " + String(builds[indexPath.row].cpu!.freqGhz)+" GHz"
        cell.ram.text = String(Int(builds[indexPath.row].Ram[0].size!)) + "GB Ram"
//        let brand = cell.CPUName.text?.lowercased()
//        if(brand!.contains("intel")){
//            cell.circle.backgroundColor = UIColor.systemBlue
//        }else{
//            cell.circle.backgroundColor = UIColor.systemRed
//        }
        cell.MoBo.text = builds[indexPath.row].Motherboard?.name
        cell.gpu.text = builds[indexPath.row].gpu[0].name
        cell.Storage.text = String(Int(builds[indexPath.row].storage[0].size!)) + "GB Storage"
        cell.powerSupply.text = builds[indexPath.row].psu?.name
        //cell.backgroundColor = UIColor.purple
        return cell
    }
    
//MARK:Vars
    @IBOutlet weak var navBar: UINavigationItem!
    var buildTable :UITableView={
        let t = UITableView()
        t.backgroundColor = UIColor.red
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    var build1 = Build(Cpu: "Intel I9-9980k", FREQ: 5.1, CORENUM: 8, MOBO: "Asus Prime Z-390-A", ram: 32, STOREAGE: 1024, Gpu: "Nvidia RTX 2080 Ti",Psu: "SEASONIC 1300w")
    //var build1 = Build.setuptable(c: "Intel I9-9980k", f: 5.1, Cn: 8, M: "Asus Prime Z-390-A", r: 32, S: 1024, G: "Nvidia RTX 2080 Ti")
    let build2 = Build(Cpu: "AMD Threadripper 1920x", FREQ: 3.7, CORENUM: 12, MOBO: "Aorus PRO X399", ram: 32, STOREAGE: 1024, Gpu: "AMD RX 580",Psu: "EVGA Bronze 850W")
    
//MARK:Setups
    override func viewDidLoad() {
        super.viewDidLoad()
        builds.append(build1!)
        builds.append(build2!)

        setupTable()
        navigationController?.navigationBar.prefersLargeTitles = true
        navBar.title = "PC Builds"
        navBar.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(handleAdd))
    }
    func setupTable(){
        buildTable.register(buildCell.self, forCellReuseIdentifier: "cellId")
        buildTable.delegate = self
        buildTable.dataSource = self
        buildTable.rowHeight = 110
        buildTable.separatorStyle = .none
        buildTable.separatorColor = UIColor.label
        view.addSubview(buildTable)
        NSLayoutConstraint.activate([
            buildTable.topAnchor.constraint(equalTo: view.topAnchor),
            buildTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            buildTable.leftAnchor.constraint(equalTo: view.leftAnchor),
            buildTable.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
//MARK:Handlers
    @objc func handleAdd(){
        performSegue(withIdentifier: "addBuild", sender: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
