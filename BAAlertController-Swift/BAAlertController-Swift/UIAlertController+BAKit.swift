//
//  UIAlertController+BAKit.swift
//  yunLianApp
//
//  Created by boai on 2018/1/6.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation
import UIKit

public typealias BAKit_UIAlertController_ButtonActionBlock = (_ index:Int, _ alertController:UIAlertController) -> ()
public typealias BAKit_UIAlertController_TextFieldConfigurationActionBlock = (_ textField:UITextField, _ index:Int) -> ()

extension UIAlertController {
    
    /// UIAlertController：快速创建一个 普通的 alert
    ///
    /// - Parameters:
    ///   - viewController: viewController
    ///   - title: 标题
    ///   - message: 内容
    ///   - buttonTitleArray: 按钮标题数组
    ///   - buttonTitleColorArray: 按钮标题颜色数组
    ///   - actionBlock: 按钮点击事件 block
    public func ba_alertController(_ viewController: UIViewController, title: String,
                                   message: String, buttonTitleArray:Array<String?>,
                                   buttonTitleColorArray:Array<UIColor?>, actionBlock : @escaping BAKit_UIAlertController_ButtonActionBlock) {
        
        self.ba_creatAlertController(UIAlertControllerStyle.alert, viewController: viewController, title: title, message: message, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: buttonTitleColorArray, buttonDisabledWithTitleArray: [], textFieldPlaceholderArray: [], textFieldConfigurationActionBlock: nil , actionBlock: actionBlock)
    }
    
    /// UIAlertController：快速创建一个 普通的 actionSheet
    ///
    /// - Parameters:
    ///   - viewController: viewController
    ///   - title: 标题
    ///   - message: 内容
    ///   - buttonTitleArray: 按钮标题数组
    ///   - buttonTitleColorArray: 按钮标题颜色数组
    ///   - actionBlock: 按钮点击事件 block
    public func ba_actionSheet(_ viewController: UIViewController, title: String,
                                   message: String, buttonTitleArray:Array<String?>,
                                   buttonTitleColorArray:Array<UIColor?>, actionBlock : @escaping BAKit_UIAlertController_ButtonActionBlock) {
        
        self.ba_creatAlertController(UIAlertControllerStyle.actionSheet, viewController: viewController, title: title, message: message, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: buttonTitleColorArray, buttonDisabledWithTitleArray: [], textFieldPlaceholderArray: [], textFieldConfigurationActionBlock: nil , actionBlock: actionBlock)
    }
    
    /// UIAlertController： 快速创建一个系统 普通 带 textField 的 alert
    ///
    /// - Parameters:
    ///   - viewController: viewController
    ///   - title: 标题
    ///   - message: 内容
    ///   - buttonTitleArray: 按钮标题数组
    ///   - buttonTitleColorArray: 按钮标题颜色数组
    ///   - buttonDisabledWithTitleArray: 按钮标题颜色数组(默认不能点击)
    ///   - textFieldPlaceholderArray: textField 的 Placeholder 数组
    ///   - textFieldConfigurationActionBlock: textField 配置 block
    ///   - actionBlock: 按钮点击事件 block
    public func ba_alertController(_ viewController: UIViewController, title: String,
                                   message: String, buttonTitleArray:Array<String?>,
                                   buttonTitleColorArray:Array<UIColor?>, buttonDisabledWithTitleArray:Array<String?>,
                                   textFieldPlaceholderArray:Array<String?>,
                                   textFieldConfigurationActionBlock: BAKit_UIAlertController_TextFieldConfigurationActionBlock?, actionBlock : @escaping BAKit_UIAlertController_ButtonActionBlock) {
        
        self.ba_creatAlertController(UIAlertControllerStyle.alert, viewController: viewController, title: title, message: message, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: buttonTitleColorArray, buttonDisabledWithTitleArray: buttonDisabledWithTitleArray, textFieldPlaceholderArray: textFieldPlaceholderArray, textFieldConfigurationActionBlock: textFieldConfigurationActionBlock, actionBlock: actionBlock)
    }
    
    private func ba_creatAlertController(_ preferredStyle:UIAlertControllerStyle,
                                         viewController: UIViewController,
                                         title: String,
                                         message: String,
                                         buttonTitleArray:Array<String?>,
                                         buttonTitleColorArray:Array<UIColor?>,
                                         buttonDisabledWithTitleArray:Array<String?>,
                                         textFieldPlaceholderArray:Array<String?>,
                                         textFieldConfigurationActionBlock: BAKit_UIAlertController_TextFieldConfigurationActionBlock?,
                                         actionBlock : BAKit_UIAlertController_ButtonActionBlock?) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
        
        if buttonTitleArray.count > 0
        {
            for i:Int in 0..<buttonTitleArray.count
            {
                let buttonTitle = buttonTitleArray[i]
                
                let action = UIAlertAction.init(title: buttonTitle, style: UIAlertActionStyle.default, handler: { (action) in
                    actionBlock!(i, alertController)
                })
                alertController.addAction(action)
                
                for j:Int in 0..<buttonDisabledWithTitleArray.count
                {
                    if (buttonDisabledWithTitleArray[j]?.elementsEqual(buttonTitle!))!
                    {
                        action.isEnabled = false
                    }
                }
                // 处理按钮字体颜色，待后期版本更新
                
            }
        }
        
        if preferredStyle == UIAlertControllerStyle.alert && textFieldPlaceholderArray.count > 0
        {
            for i:Int in 0..<textFieldPlaceholderArray.count
            {
                alertController.addTextField(configurationHandler: { (textField) in
                    textField.placeholder = textFieldPlaceholderArray[i]
                    
                    textFieldConfigurationActionBlock!(textField, i)
                })
            }
        }
        
        if preferredStyle == UIAlertControllerStyle.actionSheet
        {
            let action = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(action)
        }
        
        viewController.ba_currentViewController()?.present(alertController, animated: true, completion: nil)
        
    }
}

extension UIViewController {
    public func ba_currentViewController() -> UIViewController? {
        
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController
        {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("UIAlertController Error: You don't have any views set. You may be calling in viewDidload. Try viewDidappear.")
        }
        return presentedVC
    }
}




