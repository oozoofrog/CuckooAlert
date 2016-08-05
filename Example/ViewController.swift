//
//  ViewController.swift
//  Swizzle
//
//  Created by jayios on 2016. 8. 5..
//  Copyright © 2016년 gretech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.redColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        var alert = UIAlertController(title: "title", message: "message", preferredStyle: .Alert)
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
        
        alert = UIAlertController(title: "title2", message: "message2", preferredStyle: .Alert)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
        
        if let vc = self.storyboard?.instantiateViewControllerWithIdentifier("2") {
            // This will be ignored with some Warning:
            self.presentViewController(vc, animated: true, completion: nil)
        }
        
        alert = UIAlertController(title: "title3", message: "message3", preferredStyle: .Alert)
        alert.addAction(cancel)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

