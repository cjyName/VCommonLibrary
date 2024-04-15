//
//  File.swift
//  
//
//  Created by VIRNECT on 4/15/24.
//

import SwiftUI

@available(iOS 16.0.0, *)
public extension Image {
    
    @MainActor var cgImage: CGImage? {
        
        ImageRenderer(content: self).uiImage?.cgImage
    }
    
    @MainActor var ciImage: CIImage? {
        
        ImageRenderer(content: self).uiImage?.ciImage
    }
}

