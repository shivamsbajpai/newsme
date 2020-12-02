//
//  LazyImageView.swift
//  newsapp
//
//  Created by Shivam on 15/09/20.
//  Copyright © 2020 Shivam. All rights reserved.
//

import UIKit

class LazyImageView: UIImageView {
    
    func loadImage(fromURL imageURL: URL, placeHolderImage: String){
        self.image = UIImage(named: placeHolderImage)
        DispatchQueue.global().async {
            [weak self] in
            if let imageData = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
