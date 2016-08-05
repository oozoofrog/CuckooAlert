//
//  Swizzle.swift
//  Swizzle
//
//  Created by jayios on 2016. 8. 5..
//  Copyright © 2016년 gretech. All rights reserved.
//

import UIKit

@objc public class CuckooAlert: NSObject {
    
    /**
     setup swizzling for management of UIAlertController
     */
    public static func registCuckooAlert() {
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.viewDidLoad), target: #selector(UIViewController.someRemainsForOldViewDidLoad))
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.newViewDidLoad), target: #selector(UIViewController.viewDidLoad))
        
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.presentViewController(_:animated:completion:)), target: #selector(UIViewController.oldPresentViewController(_:animated:completion:)))
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.newPresentViewController(_:animated:completion:)), target: #selector(UIViewController.presentViewController(_:animated:completion:)))
    }
}

/**
 *  Wrapper for presenting view controller and alert and etc
 */
struct UIAlertControllerQueue {
    weak var target: UIViewController?
    let alert: UIAlertController
    let animated: Bool!
    let completion: (()->Void)?
    init(target: UIViewController?, alert: UIAlertController, animated: Bool = true, completion: (()->Void)? = nil) {
        self.target = target
        self.alert = alert
        self.animated = animated
        self.completion = completion
    }
    /**
     presentViewController with current values
     */
    func present() {
        guard let target = self.target else {
            return
        }
        target.presentViewController(alert, animated: animated, completion: completion)
    }
}

// MARK: - UIAlertController: resume next alert controller on removing from parent view controller
extension UIAlertController {
    private static var alertQueue = [UIAlertControllerQueue]()
    
    public override func viewDidDisappear(animated: Bool) {
        print(#function)
        // isMovingFromParentViewController doesn't work
        if nil == self.parentViewController {
            var alertQueueHaveTarget = UIAlertController.alertQueue.filter(){nil != $0.target}
            if let queue = alertQueueHaveTarget.popLast() {
                queue.present()
            }
            UIAlertController.alertQueue = alertQueueHaveTarget
        }
        super.viewDidDisappear(animated)
    }
    
    public func show(parentViewController vc: UIViewController, animated: Bool = true, completion: (()->Void)? = nil) {
        vc.presentViewController(self, animated: animated, completion: completion)
    }
}

// MARK: - UIViewController: alert management
extension UIViewController {
    
    /**
     This is will be viewDidLoad like cuckoo
     */
    @objc private func newViewDidLoad() {
        print(#function + " \(String(self))")
        self.someRemainsForOldViewDidLoad()
    }
    
    /**
     changing with some codes in viewDidLoad
     */
    @objc private func someRemainsForOldViewDidLoad() {
        assertionFailure(#function)
    }
    
    /**
     This will be presentViewController
     
     - parameter viewControllerToPresent:
     - parameter flag:
     - parameter completion:
     */
    @objc public func newPresentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        print(#function)
        switch viewControllerToPresent {
        case let alert as UIAlertController where nil != self.presentedViewController:
            UIAlertController.alertQueue = [UIAlertControllerQueue(target: self, alert: alert)] + UIAlertController.alertQueue
            return
        default:
            break
        }
        self.oldPresentViewController(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    @objc public func oldPresentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        assertionFailure(#function)
    }
  
}

/**
 change method implementation in target class
 
 - parameter targetClass:
 - parameter source:
 - parameter target:
 */
private func setInstanceMethods(targetClass cls: AnyClass, source: Selector, target: Selector) {
    method_setImplementation(class_getInstanceMethod(cls, target), method_getImplementation(class_getInstanceMethod(cls, source)))
}