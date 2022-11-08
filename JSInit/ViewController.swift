//
//  ViewController.swift
//  JSInit
//
//  Created by Nishan Bende on 03/11/22.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        View.self.rootController = self;
        
        let jsSource = "function add(a, b){ return a + b}; View.createWithProps({height: 100, width: 300, bg: '#7dd3fc', top: 200, left: 100}); View.createWithProps({height: 100, width: 300, bg: '#9f1239', top: 0, left: 0});"

        let context = JSContext()
        
        
        context?.setObject(View.self, forKeyedSubscript: "View" as (NSCopying & NSObjectProtocol)?)

//        let consoleLog: @convention(block) (String) -> Void = { message in
//            print("console.log: " + message)
//        }
//        context?.setObject(unsafeBitCast(consoleLog, to: AnyObject.self), forKeyedSubscript: "_consoleLog" as (NSCopying & NSObjectProtocol)?)
//
        DispatchQueue.global(qos: .userInitiated).async {
            context?.evaluateScript(jsSource)
        }


       
    }
    
    
    
    @IBAction func showMessage(sender: UIButton) {
        let text = sender.titleLabel?.text;
        var meaning = "";
            
        if (text == "🔥") {
            meaning = "Fire"
        } else if (text == "🎃") {
            meaning = "Pumpkin"
        } else if (text == "❤️") {
            meaning = "Heart"
        } else if (text == "🥹") {
            meaning = "Plead"
        }
        
        let alertController = UIAlertController(title: "Meaning", message: meaning, preferredStyle: UIAlertController.Style.alert)

    
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }


}

