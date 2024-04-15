//
//  File.swift
//  
//
//  Created by VIRNECT on 4/15/24.
//

import SwiftUI
import AVFoundation

extension AVPlayer {
    
    @available(iOS 16.0.0, *)
    var totalPlayTime: Double? {
        
        get async {
            
            guard let duration = try? await self.currentItem?.asset.load(.duration), !CMTIME_IS_INVALID(duration) else {
                
                return nil
            }
            
            return CMTimeGetSeconds(duration)
        }
    }
}

extension CVPixelBuffer {
    
    var cgImage: CGImage? {
        
        let ciContext = CIContext()
        let ciImage = CIImage(cvImageBuffer: self)
        return ciContext.createCGImage(ciImage, from: ciImage.extent)
    }
    
    var ciImage: CIImage? {
        
        return CIImage(cvPixelBuffer: self)
    }
}

extension CMSampleBuffer {
    
    var cgImage: CGImage? {
        
        guard let buffer = CMSampleBufferGetImageBuffer(self) else {
            return nil
        }
        
        let ciImage = CIImage(cvPixelBuffer: buffer)
        let context = CIContext(options: nil)
        
        return context.createCGImage(ciImage, from: ciImage.extent)
    }
    
    var ciImage: CIImage? {
        
        guard let buffer = CMSampleBufferGetImageBuffer(self) else {
            return nil
        }
        
        return CIImage(cvPixelBuffer: buffer)
    }
}

