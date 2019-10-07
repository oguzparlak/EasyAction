//
//  Helpers.swift
//  EasyAction
//
//  Created by Oguz Parlak on 5.10.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation

protocol BuilderDelegate {
    
    var alertController: UIAlertController { get }
    
    init(title: String, message: String)
    
}

public class AlertBuilder: AlertControllerBuilder, BuilderDelegate {
    
    var alertController: UIAlertController =
        UIAlertController(title: "Alert",
                          message: "This is an alert !",
                          preferredStyle: .alert)
    
    public init() {
        super.init(alertController: alertController)
    }
    
    required public init(title: String, message: String) {
        self.alertController = UIAlertController(title: title,
                          message: message,
                          preferredStyle: .alert)
        super.init(alertController: alertController)
    }
    
}

public class ActionSheetBuilder: AlertControllerBuilder, BuilderDelegate {
    
    var alertController: UIAlertController = UIAlertController(title: "Action",
                                                               message: "This is an ActionSheet",
                                                               preferredStyle: .actionSheet)
    
    public init() {
        super.init(alertController: alertController)
    }
    
    required public init(title: String, message: String) {
        self.alertController = UIAlertController(title: title,
                                                 message: message,
                                                 preferredStyle: .actionSheet)
        super.init(alertController: alertController)
    }
    
}

public enum Position {
    case bottom
    case middle
    case top
    
    public func getRect(_ sourceView: UIView) -> CGRect {
        switch self {
        case .bottom:
            return CGRect(x: sourceView.bounds.midX, y: sourceView.bounds.maxY, width: 0, height: 0)
        case .middle:
            return CGRect(x: sourceView.bounds.midX, y: sourceView.bounds.midY, width: 0, height: 0)
        case .top:
            return CGRect(x: sourceView.bounds.midX, y: sourceView.bounds.minY, width: 0, height: 0)
        }
    }
}
