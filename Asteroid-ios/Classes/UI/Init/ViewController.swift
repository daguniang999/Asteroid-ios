//
//  ViewController.swift
//  Asteroid-ios
//
//  Created by 陈潇炜 on 2020/6/17.
//  Copyright © 2020 陈潇炜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let screen = UIScreen.main.bounds
    var userView: UIView?
    var userImageView: UIImageView?
    var userImg: UIImage?
    var loginBtn: UIButton?
    var registerBtn: UIButton?
    var userText: UITextField?
    var pwdText: UITextField?
    var eyesView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // 初始化头像
        UserInit()
        // 初始化按钮
        buttonInit()
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(keyboardHide))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }

    @objc func keyboardHide() {
        userText?.resignFirstResponder()
        pwdText?.resignFirstResponder()
    }
    
    // 初始化头像
    func UserInit() {
        
        
        let imageViewWidth: CGFloat = 100
        let imageViewHeight: CGFloat = 100
        // 初始化头像视图
        userView = UIView()
        userView?.frame = CGRect(x: (screen.size.width - imageViewWidth) / 2,
                                y: 100, width: imageViewWidth, height: imageViewHeight)
        // 初始化头像ImgView
        userImageView = UIImageView()
        userImageView?.frame = CGRect(x: 0, y: 0, width: imageViewWidth, height: imageViewHeight)
        // 加载图片
        userImg = UIImage(named: "userIcon")
        userImageView?.contentMode = .scaleAspectFill
        userImageView?.layer.masksToBounds = true
        userImageView?.layer.cornerRadius = (userImageView?.frame.width)! / 2.0
        // 头像边框
        // userImageView?.layer.borderWidth = 1
        // userImageView?.layer.borderColor = UIColor.blue.cgColor
        // 头像阴影
        userView?.layer.shadowColor = UIColor.gray.cgColor
        userView?.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        userView?.layer.shadowRadius = 10
        userView?.layer.shadowOpacity = 1.0
        
        userImageView?.image = userImg
        userView?.addSubview(userImageView!)
        view.addSubview(userView!)
    }
    
    func buttonInit() {
        // 按钮容器
        let btnView = UIView()
        let btnViewY: CGFloat = 240
        let btnViewWidth: CGFloat = 240
        let btnViewHeight: CGFloat = 500
        btnView.frame = CGRect(x: (screen.size.width - btnViewWidth) / 2, y: btnViewY,
                                width: btnViewWidth, height: btnViewHeight)

        // 按钮全局设置
        let btnWidth: CGFloat = 220
        let btnHeight: CGFloat = 50
        let btnY: CGFloat = 20
        let space: CGFloat = 10
        
        // 账号输入框
        userText = UITextField()
        userText?.frame = CGRect(x: (btnViewWidth - btnWidth) / 2, y: btnY,
                                width: btnWidth, height: btnHeight)
        userText?.borderStyle = .roundedRect
        userText?.placeholder = "Username"
        userText?.delegate = self
        userText?.setValue(NSNumber(value: 80), forKey: "paddingRight")
        
        
        // 密码输入框
        let pwdY: CGFloat = btnY + btnHeight + 2 * space
        pwdText = UITextField()
        pwdText?.frame = CGRect(x: (btnViewWidth - btnWidth) / 2, y: pwdY,
                                width: btnWidth, height: btnHeight)
        pwdText?.borderStyle = .roundedRect
        pwdText?.placeholder = "Password"
        pwdText?.isSecureTextEntry = true
        pwdText?.delegate = self
        
        // 眼睛
        let eyeWidth:CGFloat = 22
        let eyeHeight:CGFloat = 22
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let eyesImg = UIImage(named: "eye")
        
        eyesView = UIImageView()
        eyesView!.frame = CGRect(x: 0, y: (rightView.frame.size.height - eyeHeight) / 2, width: eyeWidth, height: eyeHeight)
        
       
        eyesView!.image = eyesImg
        

        rightView.addSubview(eyesView!)
        // 添加眼睛点击事件
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(eyeClick))
        eyesView?.isUserInteractionEnabled = true
        eyesView?.addGestureRecognizer(tap)
        // 让密码输入框的右边视图为眼睛
        pwdText?.rightView = rightView
        pwdText?.rightViewMode = .always
        

        // 登录按钮
        let loginBtnY: CGFloat = pwdY + btnHeight + 5 * space
        loginBtn = UIButton(type: .custom)
        loginBtn?.frame = CGRect( x: (btnViewWidth - btnWidth) / 2 ,
                        y: loginBtnY, width: btnWidth, height: btnHeight)
        loginBtn?.backgroundColor = .blue
        loginBtn?.layer.cornerRadius = 3
        loginBtn?.setTitle("Login", for: .normal)

        view.addSubview(loginBtn!)

        // 分割线
        let lineHeight: CGFloat = 3
        let lineY: CGFloat = loginBtnY + btnHeight + 2 * space
        let line = UIView()
        line.frame = CGRect(x: (btnViewWidth - btnWidth) / 2,
                            y: lineY, width: btnWidth, height: lineHeight)
        line.backgroundColor = UIColor.init(red: 223 / 255.0, green: 223 / 255.0, blue: 223 / 255.0, alpha: 1)
        view.addSubview(line)

        // 注册按钮
        let registerBtnY: CGFloat = lineY + 2 * space
        registerBtn = UIButton(type: .custom)
        registerBtn?.frame = CGRect( x: (btnViewWidth - btnWidth) / 2 ,
                        y: registerBtnY, width: btnWidth, height: btnHeight)
        registerBtn?.backgroundColor = .red
        registerBtn?.layer.cornerRadius = 3
        registerBtn?.setTitle("register", for: .normal)
        
        btnView.addSubview(loginBtn!)
        btnView.addSubview(registerBtn!)
        btnView.addSubview(line)
        btnView.addSubview(userText!)
        btnView.addSubview(pwdText!)
        view.addSubview(btnView)
    }
    
    @objc func eyeClick() {
        pwdText?.isSecureTextEntry = !pwdText!.isSecureTextEntry
    }
}

extension ViewController: UITextFieldDelegate {
    
    override func shouldUpdateFocus(in context: UIFocusUpdateContext) -> Bool {
        print("No")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userText?.resignFirstResponder()
        pwdText?.resignFirstResponder()
        
        return true
    }
}

