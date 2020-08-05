//
//  rssStruct.swift
//  PCParts
//
//  Created by Karim Wael on 7/30/20.
//  Copyright © 2020 Karim Wael. All rights reserved.
//

import Foundation

class xMLParser: NSObject,XMLParserDelegate {
    var parser = XMLParser()
    var feeds = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var itemTitle = NSMutableString()
    var itemDescription = NSMutableString()
    var itemDate = NSMutableString()
    var link = NSMutableString()
    var img : [AnyObject] = []
    
    func initWithURL(_ url :URL) -> AnyObject {
        startParse(url)
        return self
    }
    func startParse(_ url: URL){
        feeds = []
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        parser.parse()
    }
    func allfeeds()->AnyObject{
        return feeds
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        element = elementName as NSString
        if (element as NSString).isEqual(to: "item"){
            elements =  NSMutableDictionary()
            elements = [:]
            itemTitle = NSMutableString()
            itemTitle = ""
            link = NSMutableString()
            link = ""
            itemDescription = NSMutableString()
            itemDescription = ""
            itemDate = NSMutableString()
            itemDate = ""
        }else if (element as NSString).isEqual(to: "enclosure"){
            if let urlString = attributeDict["url"] {
                img.append(urlString as AnyObject)
            }
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "item") {
            if itemTitle != "" {
                elements.setObject(itemTitle, forKey: "title" as NSCopying)
            }
            if link != "" {
                elements.setObject(link, forKey: "link" as NSCopying)
            }
            if itemDescription != "" {
                elements.setObject(itemDescription, forKey: "description" as NSCopying)
            }
            if itemDate != "" {
                elements.setObject(itemDate, forKey: "pubDate" as NSCopying)
            }
            feeds.add(elements)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if element.isEqual(to: "title") {
            itemTitle.append(string)
        } else if element.isEqual(to: "link") {
            link.append(string)
        } else if element.isEqual(to: "description") {
            itemDescription.append(string)
        } else if element.isEqual(to: "pubDate") {
            itemDate.append(string)
        }
    }
    
}
