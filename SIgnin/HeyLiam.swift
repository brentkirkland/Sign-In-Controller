//
//  HeyLiam.swift
//  SIgnin
//
//  Created by Brent Kirkland on 2/28/15.
//  Copyright (c) 2015 Brent Kirkland. All rights reserved.
//

import UIKit
import Foundation

class HeyLiam: UIViewController{
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required override init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Liam is cool")
        
    }
    
    
    
}
