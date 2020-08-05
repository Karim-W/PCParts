//
//  buildCell.swift
//  PCParts
//
//  Created by Karim Wael on 8/1/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import UIKit

class buildCell: UITableViewCell {
//MARK:Vars
    let circle :UIImageView = {
        let t = UIImageView(image: UIImage(named: "orange_Coral.png"))
        //let t = UIImageView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.layer.cornerRadius = 22
        t.clipsToBounds = true
        return t
    }()
    let CPUName:UILabel={
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.numberOfLines = 2
        t.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        return t
    }()
    let cores:UILabel={
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return t
    }()
    let MoBo:UILabel={
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return t
    }()
    let ram:UILabel={
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return t
    }()
    let gpu:UILabel={
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return t
    }()
    let Storage:UILabel={
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return t
    }()
    let powerSupply:UILabel={
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return t
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //backgroundColor = UIColor.red
        //backgroundView = UIImageView(image: UIImage(named: "orange_Coral.png"))
        self.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        addSubview(circle)
        NSLayoutConstraint.activate([
           circle.topAnchor.constraint(equalTo: self.topAnchor),
            circle.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10),
            circle.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            circle.heightAnchor.constraint(equalToConstant: 110)
        ])
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.white.withAlphaComponent(1), UIColor.white.withAlphaComponent(0.30).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = CGRect(x: 0.5, y: 1.0, width: UIScreen.main.bounds.width, height: 110)
        circle.layer.insertSublayer(gradient, at: 0)
//        let gradient2: CAGradientLayer = CAGradientLayer()
//        gradient2.colors = [UIColor.white.withAlphaComponent(1), UIColor.white.withAlphaComponent(0.30).cgColor]
//        gradient2.locations = [0.0 , 1.0]
//        gradient2.startPoint = CGPoint(x: 1.0, y: 1.0)
//        gradient2.endPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient2.frame = CGRect(x: 0.5, y: 0.75, width: UIScreen.main.bounds.width, height: 110)
//        circle.layer.insertSublayer(gradient2, at: 0)
        addSubview(CPUName)
        NSLayoutConstraint.activate([
           CPUName.topAnchor.constraint(equalTo: self.topAnchor,constant: 8),
            CPUName.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 18),
            CPUName.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            CPUName.heightAnchor.constraint(equalToConstant: 20)
        ])
        addSubview(cores)
        NSLayoutConstraint.activate([
           cores.topAnchor.constraint(equalTo: CPUName.bottomAnchor),
            cores.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 18),
            cores.widthAnchor.constraint(equalToConstant: 140),
            cores.heightAnchor.constraint(equalToConstant: 14)
        ])
        addSubview(ram)
        NSLayoutConstraint.activate([
           ram.topAnchor.constraint(equalTo: CPUName.bottomAnchor),
            ram.leftAnchor.constraint(equalTo: cores.rightAnchor),
            ram.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            ram.heightAnchor.constraint(equalToConstant: 14)
        ])
        addSubview(MoBo)
        NSLayoutConstraint.activate([
           MoBo.topAnchor.constraint(equalTo: cores.bottomAnchor),
            MoBo.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 18),
            MoBo.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            MoBo.heightAnchor.constraint(equalToConstant: 14)
        ])
        addSubview(gpu)
        NSLayoutConstraint.activate([
           gpu.topAnchor.constraint(equalTo: MoBo.bottomAnchor),
            gpu.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 18),
            gpu.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            gpu.heightAnchor.constraint(equalToConstant: 14)
        ])
        addSubview(Storage)
        NSLayoutConstraint.activate([
           Storage.topAnchor.constraint(equalTo: gpu.bottomAnchor),
            Storage.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 18),
            Storage.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            Storage.heightAnchor.constraint(equalToConstant: 14)
        ])
        addSubview(powerSupply)
        NSLayoutConstraint.activate([
           powerSupply.topAnchor.constraint(equalTo: Storage.bottomAnchor),
            powerSupply.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 18),
            powerSupply.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -10),
            powerSupply.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        
  
        
        
       

        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
