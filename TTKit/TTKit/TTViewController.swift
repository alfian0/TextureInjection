//
//  TTViewController.swift
//  TTKit
//
//  Created by M. Alfiansyah Nur Cahya Putra on 11/04/22.
//

import UIKit
import AsyncDisplayKit

open class TTViewController: ASDKViewController<ASDisplayNode> {
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(configureView),
            name: Notification.Name("INJECTION_BUNDLE_NOTIFICATION"), object: nil)
    }
    
    @objc
    open func configureView() {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
            name: Notification.Name("INJECTION_BUNDLE_NOTIFICATION"),
            object: nil)
    }
}
