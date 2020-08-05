//
//  ViewController.swift
//  PCParts
//
//  Created by Karim Wael on 7/29/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource, XMLParserDelegate, UIGestureRecognizerDelegate {
//MARK: TableView Setups
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFeed.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let browse = openLink(at: indexPath)
        return UISwipeActionsConfiguration(actions: [browse])
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = rssFeed.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! rssCell
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(white: 1, alpha: 0)
        } else {
            cell.backgroundColor = UIColor(white: 1, alpha: 0.1)
        }
        let link:String = ((myFeed.object(at: indexPath.row) as AnyObject).object(forKey: "link") as? String)!
        cell.titleLbl.text = (myFeed.object(at: indexPath.row) as AnyObject).object(forKey: "title") as? String
        cell.dateLbl.text = (myFeed.object(at: indexPath.row) as AnyObject).object(forKey: "pubDate") as? String
        var k = String()
        k = ((myFeed.object(at: indexPath.row) as AnyObject).object(forKey: "description") as? String)!
        k = k.replacingOccurrences(of: "<P><A HREF=", with:"")
        k = k.replacingOccurrences(of: "<A HREF=", with:"")
        k = k.replacingOccurrences(of: "<a href=", with:"")
        cell.descriptionLbl.text = k
        if(link.contains("news.sky")){
            cell.imageView?.image = UIImage(named: "sky.jpg")
        }else if(link.contains("Techcrunch")){
            cell.imageView?.image = UIImage(named: "tc.png")
        }else if(link.contains("appleinsider")){
            cell.imageView?.image = UIImage(named: "ai.jpeg")
        }else if(link.contains("macworld")){
            cell.imageView?.image = UIImage(named: "mw.jpeg")
        }else if(link.contains("wired")){
            cell.imageView?.image = UIImage(named: "wir.jpg")
        }else if(link.contains("venturebeat")){
            cell.imageView?.image = UIImage(named: "vb.png")
        }else if(link.contains("nytimes.com")){
            cell.imageView?.image = UIImage(named: "nyt.png")
        }else if(link.contains("bbc")){
            cell.imageView?.image = UIImage(named: "bbc.png")
        }else if(link.contains("techmeme.com")){
            cell.imageView?.image = UIImage(named: "tm.jpg")
        }else if(link.contains("technologyreview.com")){
            cell.imageView?.image = UIImage(named: "mit.png")
        }
        return cell
    }
//MARK:Vars
    var refreshControl = UIRefreshControl()
    var myFeed : NSArray = []
    var feedImgs: [AnyObject] = []
    var url: URL!
    let HomeLbl :UILabel = {
        let t = UILabel()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.text = "Home"
        t.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        t.textColor = .label
        return t
    }()
    let rssFeed : UITableView={
        let t = UITableView()
        t.backgroundColor = UIColor.systemOrange
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
//MARK: Set-ups
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheView()
        setTable()
        loadData()
        // Do any additional setup after loading the view.
    }
    func setTheView(){
        view.addSubview(HomeLbl)
        HomeLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 8).isActive = true
        HomeLbl.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 30).isActive = true
        HomeLbl.widthAnchor.constraint(equalToConstant: 140).isActive = true
        HomeLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    func setTable(){
        rssFeed.register(rssCell.self, forCellReuseIdentifier: "cellId")
        rssFeed.rowHeight = 110
        rssFeed.delegate = self
        rssFeed.dataSource = self
        view.addSubview(rssFeed)
        rssFeed.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        rssFeed.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        rssFeed.topAnchor.constraint(equalTo: HomeLbl.bottomAnchor,constant: 15).isActive = true
        rssFeed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(reloadTable), for: .valueChanged)
        rssFeed.addSubview(refreshControl)
    }
    func loadData(){
        url = URL(string: "http://www.rssmix.com/u/11852057/rss.xml")!
        loadRss(url);
    }
    func loadRss(_ data: URL){
        let myParser : xMLParser = xMLParser().initWithURL(data) as! xMLParser
        feedImgs = myParser.img as [AnyObject]
        myFeed = myParser.feeds
        rssFeed.reloadData()
    }
    @objc func reloadTable(){
        loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.refreshControl.endRefreshing()
        }
    }
    func openLink(at indexPath: IndexPath)->UIContextualAction{
        let action = UIContextualAction(style: .normal, title: "Open Link") { (action, view, completion) in
            var k:String = ((self.myFeed.object(at: indexPath.row) as AnyObject).object(forKey: "link") as? String)!
            k =  k.replacingOccurrences(of: " ", with:"")
            k =  k.replacingOccurrences(of: "\n", with:"")
            let vc = SFSafariViewController(url: URL(string: k)!)
            self.present(vc,animated: true)
            completion(true)
        }
        action.image = UIImage(systemName: "globe")
        action.backgroundColor = UIColor.systemBlue
        return action
    }
    //MARK:General purpose Functions
}

