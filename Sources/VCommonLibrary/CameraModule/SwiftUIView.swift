//
//  SwiftUIView.swift
//  
//
//  Created by VIRNECT on 4/15/24.
//

import SwiftUI

@available(iOS 15.0, *)
struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = ImagePickerCoordinator
    
    //coordinator
    @Binding var image: UIImage
    @Binding var isActive: Bool
    
    var sourceType: UIImagePickerController.SourceType = .camera
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        
        picker.sourceType = sourceType
        picker.delegate = context.coordinator as? any UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //do nothing
    }
    
    func makeCoordinator() -> ImagePicker.Coordinator {
        return ImagePickerCoordinator(image: $image, isActive: $isActive)
    }
}

@available(iOS 15.0, *)
class ImagePickerCoordinator: NSObject, UIImagePickerControllerDelegate {
    
    @Binding var image: UIImage
    @Binding var isActive: Bool
    
    init(image: Binding<UIImage>, isActive: Binding<Bool>) {
        _image = image
        _isActive = isActive
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiImage
            isActive = false
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isActive = false
    }
}
