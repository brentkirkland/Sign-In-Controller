//
//  ViewController.swift
//  SIgnin
//
//  Created by Brent Kirkland on 2/15/15.
//  Copyright (c) 2015 Brent Kirkland. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var emailbox: UIView!
    private var emailTextField: UITextField!
    private var emailcodebox: UIView!
    private var emailVerifyField: UITextField!
    private var phoneandpasswordbox: UIView!
    private var phoneTextField: UITextField!
    private var passwordTextField: UITextField!
    
    //verify button
    private var editEmail: UIButton!
    private var sendAgain: UIButton!
    private var verifyEmailCode: UIButton!
    
    //verify phone
    
    private var phonecodebox: UIView!
    private var phoneVerifyField: UITextField!
    private var editPhone: UIButton!
    private var sendAgainPhone: UIButton!
    private var verifyPhoneCode: UIButton!
    
    //login
    private var loginbox: UIView!
    private var phoneTextFieldLogin: UITextField!
    private var passwordTextFieldLogin: UITextField!
    
    //exit button
    private var exit: UIButton!
    
    //forgot button
    private var forgot: UIButton!
    private var forgotbox: UIView!
    private var emailTextFieldForgot: UITextField!
    
    //error button
    private var error: UILabel!
    
    //keyboard height
    
    private var keyboard: CGFloat! = 216.0
    
    //CURRENT VIEW
    
    private var current: UIView!
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //keyboard notifer
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardShown:", name: UIKeyboardDidShowNotification, object: nil)
        
        
        //ERROR LABEL
        error = UILabel(frame: CGRectMake(0, 350, self.view.frame.size.width, 50))
        error.text = "Oops something went wrong"
        error.textColor = UIColor.whiteColor()
        error.textAlignment = NSTextAlignment.Center
        error.hidden = true
        self.view.addSubview(error)
        
        
        //VIEW BACKGROUND
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        
        
        //EXIT BUTTON FOR MINI VIEWS
        exit = UIButton(frame: CGRectMake(self.view.frame.width - 70, 20, 50, 50))
        exit.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        exit.setTitle("Exit", forState: UIControlState.Normal)
        exit.setTitleColor(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.5), forState: UIControlState.Normal)
        exit.addTarget(self, action: "tap:", forControlEvents: UIControlEvents.TouchUpInside)
        exit.hidden = true
        exit.titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 22.0)
        self.view.addSubview(exit)
        
        
        //Pleeb Title
        var title = UILabel(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-250))
        title.textAlignment = NSTextAlignment.Center
        title.text = "Pleeb"
        title.textColor = UIColor.whiteColor()
        title.font = UIFont(name: "HelveticaNeue",
            size: 55.0)
        self.view.addSubview(title)
        
        //Pleeb Description
        var desc = UILabel(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-150))
        desc.textAlignment = NSTextAlignment.Center
        desc.text = "The College Party Finder"
        desc.textColor = UIColor.whiteColor()
        desc.font = UIFont(name: "HelveticaNeue-Thin",
            size: 16.0)
        self.view.addSubview(desc)
        
        //signup button
        var signup = UIButton.buttonWithType(UIButtonType.System) as UIButton
        signup.frame = CGRectMake(50, view.frame.height - 200, view.frame.width - 100, 50)
        signup.backgroundColor = UIColor.whiteColor()
        signup.layer.cornerRadius = 2.0
        signup.setTitle("Sign Up", forState: UIControlState.Normal)
        signup.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        signup.addTarget(self, action: "signup:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(signup)
        
        //login button
        var login = UIButton.buttonWithType(UIButtonType.System) as UIButton
        login.frame = CGRectMake(50, view.frame.height - 140, view.frame.width - 100, 50)
        login.backgroundColor = UIColor.clearColor()
        login.layer.cornerRadius = 2.0
        login.layer.borderWidth = 1.0
        login.layer.borderColor = UIColor.whiteColor().CGColor
        login.setTitle("Login", forState: UIControlState.Normal)
        login.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        login.addTarget(self, action: "login:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(login)
        
        
        
        //EMAIL BOX - FIRST BOX OF SIGN UP FORM
        var frame: CGRect = CGRectMake(50, -170, self.view.frame.size.width-100, 170)
        emailbox = UIView(frame: frame)
        emailbox.backgroundColor = UIColor.whiteColor()
        emailbox.layer.cornerRadius = 2.0
        emailbox.hidden = true
        self.view.addSubview(emailbox)
        
        //textfield
        emailTextField = UITextField(frame: CGRectMake(5, emailbox.frame.size.height-110, emailbox.frame.size.width-10, 50))
        emailTextField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        emailTextField.placeholder = "Email"
        emailTextField.keyboardAppearance = UIKeyboardAppearance.Dark
        emailTextField.keyboardType = UIKeyboardType.EmailAddress
        emailTextField.autocapitalizationType = UITextAutocapitalizationType.None
        emailTextField.autocorrectionType = UITextAutocorrectionType.No
        emailTextField.leftViewMode = UITextFieldViewMode.Always
        emailTextField.leftView = UIView(frame: CGRectMake(0,0,5,5))
        
        emailbox.addSubview(emailTextField)
        
        //Submit Button
        var emailSubmit: UIButton = UIButton(frame: CGRectMake(5, emailbox.frame.size.height-55, emailbox.frame.size.width-10, 50))
        emailSubmit.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        emailSubmit.setTitle("Verify", forState: UIControlState.Normal)
        emailSubmit.addTarget(self, action: "verify:", forControlEvents: UIControlEvents.TouchUpInside)
        emailbox.addSubview(emailSubmit)
        
        var emailLabel: UILabel = UILabel(frame: CGRectMake(5, 0, emailbox.frame.size.width-10, 40))
        emailLabel.text = "Student Email"
        emailLabel.font = UIFont(name: "HelveticaNeue-Bold",
            size: 22.0)
        emailLabel.textAlignment = NSTextAlignment.Center
        emailbox.addSubview(emailLabel)
        
        
        var emailLabelExplanation: UILabel = UILabel(frame: CGRectMake(20, 25, emailbox.frame.size.width-40, 30))
        emailLabelExplanation.text = "Pleeb is currently available for UCSB students only."
        emailLabelExplanation.font = UIFont(name: "HelveticaNeue",
            size: 9.0)
        emailLabelExplanation.numberOfLines = 2
        emailLabelExplanation.textAlignment = NSTextAlignment.Center
        emailbox.addSubview(emailLabelExplanation)
        
        
        //EMAIL CODE BOX - TO verify box
        
        //var verifyframe: CGRect = CGRectMake(50, 100, self.view.frame.size.width-100, 170)
        emailcodebox = UIView(frame:  frame)
        emailcodebox.backgroundColor = UIColor.whiteColor()
        emailcodebox.layer.cornerRadius = 2.0
        emailcodebox.hidden = true
        self.view.addSubview(emailcodebox)
        
        
        //Field for code
        emailVerifyField = UITextField(frame: CGRectMake(5, emailcodebox.frame.size.height-110, emailcodebox.frame.size.width-10, 50))
        emailVerifyField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        emailVerifyField.placeholder = "Three Digit Code"
        emailVerifyField.textAlignment = NSTextAlignment.Center
        emailVerifyField.font = UIFont(name: "HelveticaNeue",
            size: 22.0)
        emailVerifyField.keyboardAppearance = UIKeyboardAppearance.Dark
        emailVerifyField.keyboardType = UIKeyboardType.PhonePad
        emailVerifyField.autocapitalizationType = UITextAutocapitalizationType.None
        emailVerifyField.autocorrectionType = UITextAutocorrectionType.No
        emailVerifyField.addTarget(self, action: "changedText:", forControlEvents: UIControlEvents.EditingChanged)
        emailcodebox.addSubview(emailVerifyField)
        
        
        //middle line
        var middleline: UIView = UIView(frame: CGRectMake(emailcodebox.frame.size.width/2, emailcodebox.frame.size.height - 55, 1, 50))
        middleline.backgroundColor = UIColor.blackColor()
        emailcodebox.addSubview(middleline)
        
        //edit email button
        editEmail = UIButton(frame: CGRectMake(5, emailcodebox.frame.size.height-55, emailcodebox.frame.size.width/2 - 10, 50))
        editEmail.setTitle("Edit Email", forState: UIControlState.Normal)
        editEmail.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        editEmail.addTarget(self, action: "editEmail:", forControlEvents: UIControlEvents.TouchUpInside)
        emailcodebox.addSubview(editEmail)
        
        //send again button
        sendAgain = UIButton(frame: CGRectMake(emailcodebox.frame.size.width/2 + 5, emailcodebox.frame.size.height-55, emailcodebox.frame.size.width/2 - 10, 50))
        sendAgain.setTitle("Send Again", forState: UIControlState.Normal)
        sendAgain.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sendAgain.addTarget(self, action: "sendAgain:", forControlEvents: UIControlEvents.TouchUpInside)
        emailcodebox.addSubview(sendAgain)
        
        //verify code title
        var emailverifyLabel: UILabel = UILabel(frame: CGRectMake(5, 0, emailcodebox.frame.size.width-10, 40))
        emailverifyLabel.text = "Verification Code"
        emailverifyLabel.font = UIFont(name: "HelveticaNeue-Bold",
            size: 22.0)
        emailverifyLabel.textAlignment = NSTextAlignment.Center
        emailcodebox.addSubview(emailverifyLabel)
        
        //verify code description
        var emailverifyLabelExplanation: UILabel = UILabel(frame: CGRectMake(20, 25, emailcodebox.frame.size.width-40, 30))
        emailverifyLabelExplanation.text = "Enter the three digit number from the email."
        emailverifyLabelExplanation.font = UIFont(name: "HelveticaNeue",
            size: 9.0)
        emailverifyLabelExplanation.numberOfLines = 2
        emailverifyLabelExplanation.textAlignment = NSTextAlignment.Center
        emailcodebox.addSubview(emailverifyLabelExplanation)
        
        //verify code button that changes when typed
        verifyEmailCode = UIButton(frame: CGRectMake(5, emailcodebox.frame.size.height-55, emailcodebox.frame.size.width-10, 50))
        verifyEmailCode.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        verifyEmailCode.setTitle("Verify", forState: UIControlState.Normal)
        verifyEmailCode.addTarget(self, action: "verifyemailcode:", forControlEvents: UIControlEvents.TouchUpInside)
        verifyEmailCode.hidden = true
        emailcodebox.addSubview(verifyEmailCode)
        
        
        //PHONE AND PASSWORD MINI VIEW
        phoneandpasswordbox = UIView(frame: frame)
        phoneandpasswordbox.backgroundColor = UIColor.whiteColor()
        phoneandpasswordbox.layer.cornerRadius = 2.0
        phoneandpasswordbox.hidden = true
        self.view.addSubview(phoneandpasswordbox)
        
        phoneTextField = UITextField(frame: CGRectMake(5, 5, phoneandpasswordbox.frame.size.width-10, 50))
        phoneTextField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        phoneTextField.placeholder = "Phone Number"
        phoneTextField.keyboardAppearance = UIKeyboardAppearance.Dark
        phoneTextField.keyboardType = UIKeyboardType.PhonePad
        phoneTextField.autocapitalizationType = UITextAutocapitalizationType.None
        phoneTextField.autocorrectionType = UITextAutocorrectionType.No
        
        
        //spacing for next to textbox
        phoneTextField.leftViewMode = UITextFieldViewMode.Always
        phoneTextField.leftView = UIView(frame: CGRectMake(0,0,5,5))
        
        phoneandpasswordbox.addSubview(phoneTextField)
        
        passwordTextField = UITextField(frame: CGRectMake(5, 60, phoneandpasswordbox.frame.size.width-10, 50))
        passwordTextField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        passwordTextField.placeholder = "Password"
        passwordTextField.secureTextEntry = true
        passwordTextField.keyboardAppearance = UIKeyboardAppearance.Dark
        passwordTextField.keyboardType = UIKeyboardType.Default
        passwordTextField.autocapitalizationType = UITextAutocapitalizationType.None
        passwordTextField.autocorrectionType = UITextAutocorrectionType.No
        
        passwordTextField.leftViewMode = UITextFieldViewMode.Always
        passwordTextField.leftView = UIView(frame: CGRectMake(0,0,5,5))
        
        phoneandpasswordbox.addSubview(passwordTextField)
        
        var submitPhoneAndPassword: UIButton = UIButton(frame: CGRectMake(5, emailcodebox.frame.size.height-55, emailcodebox.frame.size.width-10, 50))
        submitPhoneAndPassword.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        submitPhoneAndPassword.setTitle("Submit", forState: UIControlState.Normal)
        submitPhoneAndPassword.addTarget(self, action: "submitPhoneAndPassword:", forControlEvents: UIControlEvents.TouchUpInside)
        phoneandpasswordbox.addSubview(submitPhoneAndPassword)
        
        // VERIFY PHONE FIELD
        
        phonecodebox = UIView(frame:  frame)
        phonecodebox.backgroundColor = UIColor.whiteColor()
        phonecodebox.layer.cornerRadius = 2.0
        phonecodebox.hidden = true
        
        self.view.addSubview(phonecodebox)
        
        //code field
        phoneVerifyField = UITextField(frame: CGRectMake(5, phonecodebox.frame.size.height-110, phonecodebox.frame.size.width-10, 50))
        phoneVerifyField.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        phoneVerifyField.placeholder = "Three Digit Code"
        phoneVerifyField.textAlignment = NSTextAlignment.Center
        phoneVerifyField.font = UIFont(name: "HelveticaNeue",
            size: 22.0)
        phoneVerifyField.keyboardAppearance = UIKeyboardAppearance.Dark
        phoneVerifyField.keyboardType = UIKeyboardType.PhonePad
        phoneVerifyField.autocapitalizationType = UITextAutocapitalizationType.None
        phoneVerifyField.autocorrectionType = UITextAutocorrectionType.No
        phoneVerifyField.addTarget(self, action: "changedTextPhone:", forControlEvents: UIControlEvents.EditingChanged)
        phonecodebox.addSubview(phoneVerifyField)
        
        
        //middle line
        middleline = UIView(frame: CGRectMake(emailcodebox.frame.size.width/2, emailcodebox.frame.size.height - 55, 1, 50))
        middleline.backgroundColor = UIColor.blackColor()
        phonecodebox.addSubview(middleline)
        
        //edit email button
        editPhone = UIButton(frame: CGRectMake(5, emailcodebox.frame.size.height-55, emailcodebox.frame.size.width/2 - 10, 50))
        editPhone.setTitle("Edit Phone", forState: UIControlState.Normal)
        editPhone.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        editPhone.addTarget(self, action: "editPhone:", forControlEvents: UIControlEvents.TouchUpInside)
        phonecodebox.addSubview(editPhone)
        
        //send again button
        sendAgainPhone = UIButton(frame: CGRectMake(emailcodebox.frame.size.width/2 + 5, emailcodebox.frame.size.height-55, emailcodebox.frame.size.width/2 - 10, 50))
        sendAgainPhone.setTitle("Send Again", forState: UIControlState.Normal)
        sendAgainPhone.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        sendAgainPhone.addTarget(self, action: "sendAgainPhone:", forControlEvents: UIControlEvents.TouchUpInside)
        phonecodebox.addSubview(sendAgainPhone)
        
        //verify code title
        var phoneverifyLabel: UILabel = UILabel(frame: CGRectMake(5, 0, emailcodebox.frame.size.width-10, 40))
        phoneverifyLabel.text = "Text Code"
        phoneverifyLabel.font = UIFont(name: "HelveticaNeue-Bold",
            size: 22.0)
        phoneverifyLabel.textAlignment = NSTextAlignment.Center
        phonecodebox.addSubview(phoneverifyLabel)
        
        //verify code description
        var phoneverifyLabelExplanation: UILabel = UILabel(frame: CGRectMake(20, 25, emailcodebox.frame.size.width-40, 30))
        phoneverifyLabelExplanation.text = "Enter the three digit number from the text."
        phoneverifyLabelExplanation.font = UIFont(name: "HelveticaNeue",
            size: 9.0)
        phoneverifyLabelExplanation.numberOfLines = 2
        phoneverifyLabelExplanation.textAlignment = NSTextAlignment.Center
        phonecodebox.addSubview(phoneverifyLabelExplanation)
        
        //verify code button that changes when typed
        verifyPhoneCode = UIButton(frame: CGRectMake(5, emailcodebox.frame.size.height-55, emailcodebox.frame.size.width-10, 50))
        verifyPhoneCode.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        verifyPhoneCode.setTitle("Verify", forState: UIControlState.Normal)
        verifyPhoneCode.addTarget(self, action: "verifyPhoneCode:", forControlEvents: UIControlEvents.TouchUpInside)
        verifyPhoneCode.hidden = true
        phonecodebox.addSubview(verifyPhoneCode)
        
        
        /////////////////////////////////////LOG IN//////////////////////////////////////////
        //LOG IN
        
        
        loginbox = UIView(frame: CGRectMake(50, -170, self.view.frame.size.width-100, 170))
        loginbox.backgroundColor = UIColor.whiteColor()
        loginbox.layer.cornerRadius = 2.0
        loginbox.hidden = true
        self.view.addSubview(loginbox)
        
        phoneTextFieldLogin = UITextField(frame: CGRectMake(5, 5, loginbox.frame.size.width-10, 50))
        phoneTextFieldLogin.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        phoneTextFieldLogin.placeholder = "Phone Number"
        phoneTextFieldLogin.keyboardAppearance = UIKeyboardAppearance.Dark
        phoneTextFieldLogin.keyboardType = UIKeyboardType.PhonePad
        phoneTextFieldLogin.autocapitalizationType = UITextAutocapitalizationType.None
        phoneTextFieldLogin.autocorrectionType = UITextAutocorrectionType.No
        
        
        //spacing
        phoneTextFieldLogin.leftViewMode = UITextFieldViewMode.Always
        phoneTextFieldLogin.leftView = UIView(frame: CGRectMake(0,0,5,5))
        
        
        loginbox.addSubview(phoneTextFieldLogin)
        
        passwordTextFieldLogin = UITextField(frame: CGRectMake(5, 60, loginbox.frame.size.width-10, 50))
        passwordTextFieldLogin.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        passwordTextFieldLogin.placeholder = "Password"
        passwordTextFieldLogin.secureTextEntry = true
        passwordTextFieldLogin.keyboardAppearance = UIKeyboardAppearance.Dark
        passwordTextFieldLogin.keyboardType = UIKeyboardType.Default
        passwordTextFieldLogin.autocapitalizationType = UITextAutocapitalizationType.None
        passwordTextFieldLogin.autocorrectionType = UITextAutocorrectionType.No
        passwordTextFieldLogin.addTarget(self, action: "enteredPassword:", forControlEvents: UIControlEvents.EditingChanged)
        passwordTextFieldLogin.leftViewMode = UITextFieldViewMode.Always
        passwordTextFieldLogin.leftView = UIView(frame: CGRectMake(0,0,5,5))
        
        loginbox.addSubview(passwordTextFieldLogin)
        
        forgot = UIButton(frame: CGRectMake(passwordTextFieldLogin.frame.size.width - 45, 60, 50, 50))
        forgot.backgroundColor = UIColor(red: 1/255, green: 1/255, blue: 1/255, alpha: 0.15)
        //forgot.layer.cornerRadius = 15.0
        forgot.setTitle("?", forState: UIControlState.Normal)
        forgot.addTarget(self, action: "requestPassword:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //forgot.titleLabel?.font = UIFont(name: "HelveticaNeue",
        //    size: 17.0)
        
        forgot.setTitleColor(UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0), forState: UIControlState.Normal)
        loginbox.addSubview(forgot)
        
        var submitPhoneAndPasswordLogin:UIButton = UIButton(frame: CGRectMake(5, loginbox.frame.size.height-55, loginbox.frame.size.width-10, 50))
        submitPhoneAndPasswordLogin.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        submitPhoneAndPasswordLogin.setTitle("Login", forState: UIControlState.Normal)
        submitPhoneAndPasswordLogin.addTarget(self, action: "submitLogin:", forControlEvents: UIControlEvents.TouchUpInside)
        loginbox.addSubview(submitPhoneAndPasswordLogin)
        
        
        //RESEND EMAIL
        
        forgotbox = UIView(frame: CGRectMake(50, -170, self.view.frame.size.width-100, 170))
        forgotbox.backgroundColor = UIColor.whiteColor()
        forgotbox.layer.cornerRadius = 2.0
        forgotbox.hidden = true
        self.view.addSubview(forgotbox)
        
        
        emailTextFieldForgot = UITextField(frame: CGRectMake(5, emailbox.frame.size.height-110, emailbox.frame.size.width-10, 50))
        emailTextFieldForgot.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
        emailTextFieldForgot.placeholder = "Email"
        emailTextFieldForgot.keyboardAppearance = UIKeyboardAppearance.Dark
        emailTextFieldForgot.keyboardType = UIKeyboardType.EmailAddress
        emailTextFieldForgot.autocapitalizationType = UITextAutocapitalizationType.None
        emailTextFieldForgot.autocorrectionType = UITextAutocorrectionType.No
        
        
        emailTextFieldForgot.leftViewMode = UITextFieldViewMode.Always
        emailTextFieldForgot.leftView = UIView(frame: CGRectMake(0,0,5,5))
        
        forgotbox.addSubview(emailTextFieldForgot)
        
        
        var emailSubmitForgot: UIButton = UIButton(frame: CGRectMake(5, emailbox.frame.size.height-55, emailbox.frame.size.width-10, 50))
        emailSubmitForgot.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1.0)
        emailSubmitForgot.setTitle("Reset", forState: UIControlState.Normal)
        emailSubmitForgot.addTarget(self, action: "resetPassword:", forControlEvents: UIControlEvents.TouchUpInside)
        forgotbox.addSubview(emailSubmitForgot)
        
        
        var emailLabelForgot: UILabel = UILabel(frame: CGRectMake(5, 0, emailbox.frame.size.width-10, 40))
        emailLabelForgot.text = "Forgot Your Password?"
        emailLabelForgot.font = UIFont(name: "HelveticaNeue-Bold",
            size: 22.0)
        emailLabelForgot.textAlignment = NSTextAlignment.Center
        forgotbox.addSubview(emailLabelForgot)
        
        
        var emailLabelExplanationForgot: UILabel = UILabel(frame: CGRectMake(20, 25, emailbox.frame.size.width-40, 30))
        emailLabelExplanationForgot.text = "We'll send you a reset link to your email"
        emailLabelExplanationForgot.font = UIFont(name: "HelveticaNeue",
            size: 9.0)
        emailLabelExplanationForgot.numberOfLines = 2
        emailLabelExplanationForgot.textAlignment = NSTextAlignment.Center
        forgotbox.addSubview(emailLabelExplanationForgot)
        
        
    }
    
    func resetPassword(sender: UIButton!){
        
        error.hidden = false
        error.text = "Check your email for a nift link!"
        
    }
    
    func requestPassword(sender: UIButton!){
        
        closeWindow(loginbox)
        
        emailTextFieldForgot.becomeFirstResponder()
        
        forgotbox.hidden = false
        openWindow(forgotbox)
        
        
    }
    
    func enteredPassword(sender: UITextField!){
        
        if (countElements(passwordTextFieldLogin.text) > 0){
            
            forgot.hidden = true
            
        }else {
            
            forgot.hidden = false
        }
    }
    
    func submitLogin(sender: UIButton!){
        
        if (phoneTextFieldLogin.text == "" || passwordTextFieldLogin.text == "" ){
            error.hidden = false
            error.text = "Please enter a phone number or password"
        }
        if ((phoneTextFieldLogin.text.utf16Count) != 10){
            error.hidden = false
            error.text = "Please enter a ten digit phone number"
            
        }
        if(phoneTextFieldLogin.text.utf16Count > 5 && (phoneTextFieldLogin.text.utf16Count) == 10){
            
            closeWindow(loginbox)
            
            //open app
            //enter realm information
            
            self.view.endEditing(true)
            
        }
        
    }
    
    func submitPhoneAndPassword(sender: UIButton!){
        
        if (phoneTextField.text == "" || passwordTextField.text == "" ){
            error.hidden = false
            error.text = "Please enter a phone number or password"
        }
        if ((phoneTextField.text.utf16Count) != 10){
            error.hidden = false
            error.text = "Please enter a ten digit phone number"
            
        }
        if(phoneTextField.text.utf16Count < 5)
        {
            error.hidden = false
            error.text = "Password must be 5 or more characters"
            
        }
        if(phoneTextField.text.utf16Count > 5 && (phoneTextField.text.utf16Count) == 10){
            
            closeWindow(phoneandpasswordbox)
            
            phonecodebox.hidden = false
            phoneVerifyField.becomeFirstResponder()
            openWindow(phonecodebox)
            
        }
        
        
        
    }
    
    func keyboardShown(notification: NSNotification) {
        let info  = notification.userInfo!
        let value: AnyObject = info[UIKeyboardFrameEndUserInfoKey]!
        
        let rawFrame = value.CGRectValue()
        let keyboardFrame = view.convertRect(rawFrame, fromView: nil)
        
        keyboard = keyboardFrame.height
        
        println("keyboardFrame: \(keyboardFrame.height)")
    }
    
    func signup(sender:UIButton!){
        
        
        emailbox.hidden = false
        emailTextField.becomeFirstResponder()
        openWindow(emailbox)
        
        
        
    }
    //todo add other email list
    func verify(sender: UIButton!){
        
        if (emailTextField.text == "" || emailTextField.text.lowercaseString.rangeOfString(".ucsb.edu") == nil || emailTextField.text.lowercaseString.rangeOfString("@") == nil){
            error.hidden = false
            error.text = "Please enter a valid UCSB email"
        }
        else{
            
            //            let parameters = [ "email" : emailTextField.text]
            
            //            Alamofire.request(.PUT, "http://198.199.118.177:9000/api/users/email", parameters:parameters, encoding: .JSON).responseJSON { (req, res, json, error) in
            //                if(error != nil) {
            //                    NSLog("Error: \(error)")
            //                    println(req)
            //                    println(res)
            //
            //                    self.error.text = "Oops! Cinderblock"
            //
            //                }else {
            //                    println("success PUT")
            //                }
            //        }
            
            //            closeWindow()
            
            closeWindow(emailbox)
            
            emailcodebox.hidden = false
            openWindow(emailcodebox)
            emailVerifyField.becomeFirstResponder()
        }
    }
    
    func editEmail(sender: UIButton!){
        
        closeWindow(emailcodebox)
        emailbox.hidden = false
        emailTextField.becomeFirstResponder()
        openWindow(emailbox)
        
        
    }
    
    func editPhone(sender: UIButton!){
        
        closeWindow(phonecodebox)
        phoneandpasswordbox.hidden = false
        phoneTextField.becomeFirstResponder()
        openWindow(phoneandpasswordbox)
        
        
    }
    
    func sendAgain(sender: UIButton!){
        
        //request email again
        
        
        
    }
    
    func sendAgainPhone(sender: UIButton!){
        
        //request password again
        
    }
    
    func changedText(sender: UITextField!){
        
        if (countElements(emailVerifyField.text) != 3){
            
            verifyEmailCode.hidden = true
            
        }else {
            
            verifyEmailCode.hidden = false
        }
        
        
        
    }
    
    func changedTextPhone(sender: UITextField!){
        
        if (countElements(phoneVerifyField.text) != 3){
            
            verifyPhoneCode.hidden = true
            
        }else {
            
            verifyPhoneCode.hidden = false
        }
        
        
    }
    
    func verifyPhoneCode(sender: UIButton!) {
        
        //OPEN APP IF GOOD
        //SWITCH VIEW CONTROLLER
        
        //THROW ERROR IF BAD
        
        
    }
    
    func verifyemailcode(sender: UIButton!){
        
        
        error.hidden = true
        error.text = ""
        closeWindow(emailcodebox)
        phoneandpasswordbox.hidden = false
        phoneTextField.becomeFirstResponder()
        openWindow(phoneandpasswordbox)
        
        
        
    }
    
    func tap(sender: UIButton!){
        
        if(!emailbox.hidden) { closeWindow(emailbox) }
        if(!emailcodebox.hidden) { closeWindow(emailcodebox)}
        if(!phoneandpasswordbox.hidden) { closeWindow(phoneandpasswordbox)}
        if(!phonecodebox.hidden) { closeWindow(phonecodebox) }
        if(!loginbox.hidden) {closeWindow(loginbox) }
        if(!forgotbox.hidden) {closeWindow(forgotbox) }
        
        self.view.endEditing(true)
        
    }
    
    //animation functions
    
    func closeWindow(moveView: UIView){
        
        exit.hidden = true
        
        println("whatthefuck")
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            moveView.frame = CGRectMake(50, self.view.frame.size.height, self.view.frame.size.width-100, moveView.frame.size.height)
            
            }, completion: ({ success in
                
                moveView.hidden = true
                self.error.hidden = true
                self.error.text = ""
                moveView.frame = CGRectMake(50, -moveView.frame.size.height, self.view.frame.size.width-100, moveView.frame.size.height)
                
            }))
        
    }
    
    func openWindow(moveView: UIView){
        
        exit.hidden = false
        
        UIView.animateWithDuration(0.3, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            
            moveView.frame = CGRectMake(50, (self.view.frame.height-self.keyboard)/2-(moveView.frame.size.height/2), self.view.frame.size.width-100, moveView.frame.size.height)
            
            }, completion: ({ success in
                
                println("Window did appear")
                
            }))
        
    }
    
    func login(sender: UIButton!) {
        
        loginbox.hidden = false
        phoneTextFieldLogin.becomeFirstResponder()
        openWindow(loginbox)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

