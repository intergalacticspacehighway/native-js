//
//  View.swift
//  JSInit
//
//  Created by Nishan Bende on 08/11/22.
//
import Foundation
import UIKit

class View: NSObject, ViewExport {
    static var rootController : ViewController? = nil;
    
    
    static func create(props: Dictionary<String,Any>) {
        DispatchQueue.main.async {
            let view = UIView();
            
            let height = props["height"];
            let width = props["width"];
            let top = props["top"];
            let left = props["left"];
            
            view.frame =  CGRect(x: top as! Int, y: left as! Int, width: width as! Int, height: height as! Int)

            if let bg = props["bg"] as? String {
                view.backgroundColor = hexStringToUIColor(hex: bg);
            }
            
            rootController?.view.addSubview(view)
            
            print("i just got called ", props["height"], props["width"], props["bg"]);
        }
    }
    
    dynamic var props: ViewProps?
    
    
    init(props: ViewProps) {
      self.props = props
    }
    
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

