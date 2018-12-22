//
//  UIImageView+ImageDownloader.swift
//  marvel
//
//  Created by Mateus Campos on 22/12/18.
//  Copyright © 2018 Mateus Campos. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    
    func dowloadFromServer(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        print(url)
        
        contentMode = mode
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
        
    }
    
    func dowloadFromServer(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {

        guard let url = URL(string: link) else { return }
        dowloadFromServer(url: url, contentMode: mode)
        
    }
    
}
