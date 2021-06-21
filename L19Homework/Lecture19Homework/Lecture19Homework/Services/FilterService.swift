//
//  FilterService.swift
//  Lecture19Homework
//
//  Created by Egor Lass on 21.06.2021.
//

import UIKit

class FilterService {
    
    let context = CIContext()
    
    func applyFilter(image: UIImage, filter: String, value: Int) -> UIImage {
        if let filter = CIFilter(name: filter) {
            let image = CIImage(image: image)
            filter.setValue(image, forKey: kCIInputImageKey)
            filter.setValue(value, forKey: kCIInputIntensityKey)
            if let filteredImage = filter.outputImage {
                if let newImage = context.createCGImage(filteredImage, from: filteredImage.extent) {
                    let result = UIImage(cgImage: newImage)
                    return result
                }
            }
        }
        return image
    }
}
