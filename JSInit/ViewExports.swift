//
//  View.swift
//  JSInit
//
//  Created by Nishan Bende on 08/11/22.
//

import JavaScriptCore

@objc protocol ViewExport: JSExport {
    @objc var props: ViewProps? { get set }
    
    static func create(props: Dictionary<String,Any>) -> Void
}


class ViewProps: NSObject {
    let width: Double
    let height: Double
    let bg: String

    init(width: Double, height: Double, bg: String) {
        self.width = width
        self.height = height
        self.bg = bg
    }
}


