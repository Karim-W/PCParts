//
//  componentCell.swift
//  PCParts
//
//  Created by Karim Wael on 8/3/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import UIKit

var leftC =  CGFloat()
var rightC =  CGFloat()

class componentCell: UICollectionViewCell {
    let pannel:UIView = {
        let t = UIView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    let titleLbl:UILabel={
        let t = UILabel()
        t.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    let RGBview:UIImageView = {
        let t = UIImageView()
        t.image = UIImage(named: "RNBW.jpg")
        t.translatesAutoresizingMaskIntoConstraints = false
        t.layer.cornerRadius = 16
        t.clipsToBounds = true
        return t
    }()
    
    let widtH = (UIScreen.main.bounds.width-10)/2
    let heighT = (UIScreen.main.bounds.height-45)/3
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = UIColor.systemGreen
        addSubview(pannel)
        NSLayoutConstraint.activate([
           pannel.topAnchor.constraint(equalTo: self.topAnchor),
           pannel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: leftC),
           pannel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: rightC),
            pannel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        addSubview(RGBview)
        NSLayoutConstraint.activate([
           RGBview.topAnchor.constraint(equalTo: self.topAnchor),
           RGBview.leftAnchor.constraint(equalTo: self.leftAnchor,constant: leftC),
           RGBview.rightAnchor.constraint(equalTo: self.rightAnchor,constant: rightC),
            RGBview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        RGBview.isHidden = true
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [UIColor.white.withAlphaComponent(1), UIColor.white.withAlphaComponent(0.30).cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.frame = CGRect(x: 0.5, y: 1.0, width: widtH - leftC + rightC, height: heighT)
        pannel.layer.insertSublayer(gradient, at: 0)
        let gradient2: CAGradientLayer = CAGradientLayer()
        gradient2.colors = [UIColor.white.withAlphaComponent(1), UIColor.white.withAlphaComponent(0.30).cgColor]
        gradient2.locations = [0.0 , 1.0]
        gradient2.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradient2.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient2.frame = CGRect(x: 0.5, y: 0.75,  width: widtH - leftC + rightC, height: heighT)
        pannel.layer.insertSublayer(gradient2, at: 0)
        pannel.layer.cornerRadius = 16
        pannel.clipsToBounds = true
        addSubview(titleLbl)
        NSLayoutConstraint.activate([
           titleLbl.topAnchor.constraint(equalTo: pannel.topAnchor,constant: 8 ),
           titleLbl.leftAnchor.constraint(equalTo: pannel.leftAnchor,constant: 8),
           titleLbl.rightAnchor.constraint(equalTo: pannel.rightAnchor,constant: -8),
            titleLbl.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
