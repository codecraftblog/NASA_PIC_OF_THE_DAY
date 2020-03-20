//
//  Post.swift
//  NasaDemoApp
//
//  Created by Moorthy, Prashanth on 08/03/20.
//  Copyright © 2020 Moorthy, Prashanth. All rights reserved.
//

import Foundation
import UIKit

protocol PostDelegate {
    func postFetched(post : Post)
    func postDidUpdateLowResImage(image : UIImage)
    func postDidUpdateHDImage(image : UIImage)
}

extension PostDelegate {
    func postFetched(post: Post) {}
    func postDidUpdateLowResImage(image : UIImage) {}
    func postDidUpdateHDImage(image : UIImage) {}
}

struct Post {
    
    var title : String
    var description : String
    var date : String
    var copyright : String?
    var imageURLString : String
    var imageHDURLString : String
    var hdImage : UIImage?
    
    // Init a Post from the APOD JSON
    init(apodJSON : [String : String]) {
        title = apodJSON["title"] ?? ""
        description = apodJSON["explanation"] ?? ""
        date = apodJSON["date"] ?? ""
        copyright = apodJSON["copyright"]
        imageURLString = apodJSON["url"] ?? ""
        imageHDURLString = apodJSON["hdurl"] ?? ""
    }
    
    var delegate : PostDelegate?
    
    var lowResImage : UIImage {
        return fetchLowResImage_Crude()
        //return fetchLowResImage()
    }

//    var highResImage : UIImage {
//        return fetchHighResImage()
//    }
    
    private func fetchLowResImage_Crude() -> UIImage {
        if let imageURL = URL(string: imageURLString),
            let lowResImageData = try? Data(contentsOf: imageURL){
            return UIImage(data: lowResImageData) ?? UIImage()
        }
        return UIImage()
    }


//    private func fetchLowResImage() -> UIImage {
//
//        let image =  CacheManager.shared.getImageForKey(key: imageURLString)
//        if (image != nil) {
//            print("👍🏻 Fetched from Cache : For URL -> \(imageURLString)")
//        }
//
//        if image == nil {
//            print("Warming Cache : For URL -> \(imageURLString)")
//
//            NetworkManager.shared.fetchImageForURL(imageURLString: imageURLString) { (fetchedImage) in
//                CacheManager.shared.setImage(image: fetchedImage, forKey: self.imageURLString)
//                self.delegate?.postDidUpdateLowResImage(image: fetchedImage)
//            }
//        }
//        return image ?? UIImage()
//    }
//
//    private func fetchHighResImage() -> UIImage {
//
//        let image =  CacheManager.shared.getImageForKey(key: imageHDURLString)
//        if (image != nil) {
//            print("👍🏻 Fetched from Cache : For URL -> \(imageHDURLString)")
//        }
//
//        if image == nil {
//            print("Warming Cache : For URL -> \(imageHDURLString)")
//
//            NetworkManager.shared.fetchImageForURL(imageURLString: imageHDURLString) { (fetchedImage) in
//                CacheManager.shared.setImage(image: fetchedImage, forKey: self.imageHDURLString)
//                self.delegate?.postDidUpdateHDImage(image: fetchedImage)
//            }
//        }
//        return image ?? UIImage(systemName: "photo") ?? UIImage()
//    }
}
