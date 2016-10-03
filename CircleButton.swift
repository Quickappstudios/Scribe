//
//  CircleButton.swift
//  scribe
//
//  Created by QUICK APPS STUDIOS on 03/10/2016.
//  Copyright © 2016 QUICK APPS STUDIOS. All rights reserved.
//

import UIKit


 @IBDesignable

class CircleButton: UIButton {
    
 
    @IBInspectable var cornerRadius: CGFloat = 30.0{
        
        didSet{
            
            
            
            
         setupView()
            
            
        }
        
    }
    
    
    
   
    
        func setupView() {
        
      layer.cornerRadius = cornerRadius
        
        
        }
        
        
    }
    
    
    
    
    

