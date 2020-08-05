//
//  rssCell.swift
//  PCParts
//
//  Created by Karim Wael on 7/30/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import UIKit

class rssCell: UITableViewCell {
//MARK: Vars
    let titleLbl :UILabel = {
        let t = UILabel()
        t.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        t.numberOfLines = 3
        //t.lineBreakMode = .byWordWrapping
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    let descriptionLbl:UILabel = {
        let t = UILabel()
        t.numberOfLines = 5
        t.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    let imgView : UIImageView = {
        let t = UIImageView()
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    let dateLbl:UILabel = {
        let t = UILabel()
        t.font = UIFont.systemFont(ofSize: 14, weight: .light)
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    var titleHeight:NSLayoutConstraint?
    var descriptionHeight: NSLayoutConstraint?
    
    //MARK:Setups
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    func setupCell(){
        addSubview(imgView)
        imgView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10).isActive = true
        imgView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgView.layer.cornerRadius = 45
        imgView.layer.masksToBounds = true
        addSubview(dateLbl)
        NSLayoutConstraint.activate([
            dateLbl.topAnchor.constraint(equalTo: self.topAnchor),
            dateLbl.leftAnchor.constraint(equalTo: imgView.rightAnchor,constant: 20),
            dateLbl.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -15),
            dateLbl.heightAnchor.constraint(equalToConstant: 20)
        ])
        addSubview(titleLbl)
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: dateLbl.bottomAnchor),
            titleLbl.leftAnchor.constraint(equalTo: imgView.rightAnchor,constant: 20),
            titleLbl.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -15),
            //titleLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            titleLbl.heightAnchor.constraint(equalToConstant: 40)
        ])
        addSubview(descriptionLbl)
        NSLayoutConstraint.activate([
            descriptionLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor),
            descriptionLbl.leftAnchor.constraint(equalTo: imgView.rightAnchor,constant: 20),
            descriptionLbl.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -15),
            descriptionLbl.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
