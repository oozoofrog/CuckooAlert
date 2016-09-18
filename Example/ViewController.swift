//
//  ViewController.swift
//  Swizzle
//
//  Created by jayios on 2016. 8. 5..
//  Copyright © 2016년 gretech. All rights reserved.
//

import UIKit
import CuckooAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.red
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        var alert = UIAlertController(title: "title", message: "message", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
        alert = UIAlertController(title: "title2", message: "message2", preferredStyle: .alert)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "2") {
            // This will be ignored with some Warning:
            self.present(vc, animated: true, completion: nil)
        }
        
        alert = UIAlertController(title: "title3", message: "message3", preferredStyle: .alert)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
        
        self.prompt("HI~", autoclosing: 0.25)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

