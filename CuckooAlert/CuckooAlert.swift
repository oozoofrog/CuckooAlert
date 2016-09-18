//
//  Swizzle.swift
//  Swizzle
//
//  Created by jayios on 2016. 8. 5..
//  Copyright © 2016년 gretech. All rights reserved.
//

import UIKit

@objc open class CuckooAlert: NSObject {
    
    /**
     setup swizzling for management of UIAlertController
     */
    open static func registCuckooAlert() {
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.viewDidLoad), target: #selector(UIViewController.someRemainsForOldViewDidLoad))
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.newViewDidLoad), target: #selector(UIViewController.viewDidLoad))
        
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.present(_:animated:completion:)), target: #selector(UIViewController.oldPresentViewController(_:animated:completion:)))
        setInstanceMethods(targetClass: UIViewController.self, source: #selector(UIViewController.newPresentViewController(_:animated:completion:)), target: #selector(UIViewController.present(_:animated:completion:)))
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
        target.present(alert, animated: animated, completion: completion)
    }
}

// MARK: - UIAlertController: resume next alert controller on removing from parent view controller
extension UIAlertController {
    fileprivate static var alertQueue = [UIAlertControllerQueue]()
//    private static let presentQueue = dispatch_queue_create("com.CuckooAlert.present", DISPATCH_QUEUE_SERIAL)
    
    open override func viewDidDisappear(_ animated: Bool) {
        print(#function)
        // isMovingFromParentViewController doesn't work
        if nil == self.parent {
            var alertQueueHaveTarget = UIAlertController.alertQueue.filter(){nil != $0.target}
            if let queue = alertQueueHaveTarget.popLast() {
                queue.present()
            }
            UIAlertController.alertQueue = alertQueueHaveTarget
        }
        super.viewDidDisappear(animated)
    }
    
    public func show(parentViewController vc: UIViewController, animated: Bool = true, completion: (()->Void)? = nil) {
        DispatchQueue.main.async {
            vc.present(self, animated: animated, completion: completion)
        }
    }
}

// MARK: - UIViewController: alert management
extension UIViewController {
    
    /**
     This is will be viewDidLoad like cuckoo
     */
    @objc fileprivate func newViewDidLoad() {
        self.someRemainsForOldViewDidLoad()
    }
    
    /**
     changing with some codes in viewDidLoad
     */
    @objc fileprivate func someRemainsForOldViewDidLoad() {
        assertionFailure(#function)
    }
    
    /**
     This will be presentViewController
     
     - parameter viewControllerToPresent:
     - parameter flag:
     - parameter completion:
     */
    @objc public func newPresentViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        switch viewControllerToPresent {
        case let alert as UIAlertController where nil != self.presentedViewController:
            UIAlertController.alertQueue = [UIAlertControllerQueue(target: self, alert: alert)] + UIAlertController.alertQueue
            return
        default:
            break
        }
        self.oldPresentViewController(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    @objc public func oldPresentViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        assertionFailure(#function)
    }
    
    /**
     prompt to navigation bar
     
     - parameter message:     prompt message
     - parameter autoclosing: time limit for removing prompt, 0 is infinite prompt
     */
    public func prompt(_ message: String, autoclosing: TimeInterval = 0) {
        self.navigationItem.prompt = message
        if 0 < autoclosing {
            weak var weakNavigationItem: UINavigationItem? = self.navigationItem
            // minimum delay to 0.5 sec. more little value do not animation.
            let delay = max(0.5, autoclosing)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                weakNavigationItem?.prompt = nil
            })
        }
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
