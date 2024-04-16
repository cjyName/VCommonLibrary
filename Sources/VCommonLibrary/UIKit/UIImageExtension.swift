//
//  File.swift
//  
//
//  Created by VIRNECT on 4/16/24.
//

import UIKit

extension UIImage {
    
    func resizeImage(maxSize: CGFloat) throws {
        
        var actualHeight = self.size.height
        var actualWidth = self.size.width
        
        guard actualHeight > maxSize || actualWidth > maxSize else {
            
            throw NSError(domain: "image large", code: 999)
        }
        
        var imgRatio: CGFloat = actualWidth / actualHeight
        
        if imgRatio < 1 {
            imgRatio = maxSize / actualHeight
            actualWidth = imgRatio * actualWidth
            actualHeight = maxSize
        } else {
            imgRatio = maxSize / actualWidth
            actualHeight = imgRatio * actualHeight
            actualWidth = maxSize
        }
        
        let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        self.draw(in: rect)
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
}


