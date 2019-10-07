//
//  EasyAction.swift
//  EasyAction
//
//  Created by Oguz Parlak on 5.10.2019.
//  Copyright © 2019 Oguz Parlak. All rights reserved.
//

import Foundation
import UIKit

public class AlertControllerBuilder {
    
    /// AlertController to be presented
    private let alertController: UIAlertController
    
    /// The top most view controller currently presented
    private let topMostViewController: UIViewController? = UIApplication.getTopViewController()
    
    /// A flag that indicates whether a customization has just made for iPad
    private var customizedForIPad: Bool = false
    
    // MARK: - Init
    init(alertController: UIAlertController) {
        self.alertController = alertController
    }
    
    /// Sets the title of your action
    /// - Parameter title: The title of the AlertController
    @discardableResult
    public func setTitle(_ title: String) -> AlertControllerBuilder {
        alertController.title = title
        return self
    }
    
    /// Sets the message of your action
    /// - Parameter message: The message to be shown in the AlertController
    @discardableResult
    public func setMessage(_ message: String) -> AlertControllerBuilder {
        alertController.message = message
        return self
    }
    
    /// Adds an action into your AlertController
    /// - Parameter action: The action to be add into your AlertController
    @discardableResult
    public func addAction(_ title: String,
                          style: UIAlertAction.Style = .default,
                          _ handler: VoidHandler? = nil,
                          textFieldHandler: TextFieldsHandler? = nil) -> AlertControllerBuilder {
        alertController.addAction(EasyAction(title: title,
                                             style: style,
                                             handler: { _ in
            handler?()
            textFieldHandler?(self.alertController.textFields)
        }))
        return self
    }
    
    /// Adds a text field to your AlertController
    /// - Parameter action: The action to be add into your AlertController
    @discardableResult
    public func addTextField(_ handler: TextFieldConfigurationHandler? = nil) -> AlertControllerBuilder {
        guard let _ = self as? AlertBuilder else { return self }
        alertController.addTextField(configurationHandler: handler)
        return self
    }
    
    /// Sets the tint color of your AlertController
    /// - Parameter action: The action to be add into your AlertController
    @discardableResult
    public func setTintColor(_ tint: UIColor) -> AlertControllerBuilder {
        alertController.view.tintColor = tint
        return self
    }
    
    /// Presents the AlertController at the direction specified
    /// - Parameter position: The position of the AlertController to be presented
    /// - Note: Position only can changed if the current device is iPad
    public func show(in direction: Position = .middle) {
        guard let controller = topMostViewController else { return }
        if let popOverController = alertController.popoverPresentationController, !customizedForIPad {
            let view: UIView = controller.view
            popOverController.sourceView = view
            popOverController.sourceRect = direction.getRect(view)
            popOverController.permittedArrowDirections = []
        }
        controller.present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - iPad Configurations
extension AlertControllerBuilder {
    
    /// Sets bar button item to present your AlertController
    /// - Parameter item: The item to be referenced to show your AlertController
    /// - Note: This function is only required for iPad
    @discardableResult
    public func setBarButtonItem(_ item: UIBarButtonItem) -> AlertControllerBuilder {
        if let popOverController = alertController.popoverPresentationController {
            popOverController.barButtonItem = item
        }
        customizedForIPad = true
        return self
    }
    
    /// Sets the source view of your AlertController
    /// - Parameter source: The source view to be referenced to show your AlertController
    /// - Note: This function is only required for iPad
    @discardableResult
    public func setPresentingSource(_ source: UIView) -> AlertControllerBuilder {
        if let popoverController = alertController.popoverPresentationController {
            popoverController.sourceView = source
            popoverController.sourceRect = source.bounds
        }
        customizedForIPad = true
        return self
    }
    
}
