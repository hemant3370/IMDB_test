//
//  UIImageView+Extensions.swift
//  IMDB
//
//  Created by Hemant Singh on 28/05/22.
//

import Foundation
import UIKit

extension UIImageView {
    public func setImage(with url: URL) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
        task.resume()
    }
}
