//
//  PSIServices.swift
//  PSIDemo
//
//  Created by Viraj Dongre on 02/12/19.
//  Copyright © 2019 Viraj Dongre. All rights reserved.
//

import Foundation

class PSIServices {
    
    class func fetchPSIData(withCompletion completion: @escaping (Root?) -> Void) {
        
        APIManager().dataRequest(with: Constants.BASE_URL) { result in
            switch result {
            case .success(let data):
                let root = try? JSONDecoder().decode(Root.self, from: data)
                completion(root)
            case .failure(_):
                completion(nil)
            }
        }
    }
}
