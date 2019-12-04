//
//  APIManager.swift
//  PSIDemo
//
//  Created by Viraj Dongre on 02/12/19.
//  Copyright © 2019 Viraj Dongre. All rights reserved.
//

import Foundation

//APPError enum which shows all possible errors
enum APPError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

//Result enum to show success or failure
enum Result {
    case success(Data)
    case failure(APPError)
}

class APIManager {
    //dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest(with url: String, completion: @escaping (Result) -> Void) {

        //create the url with NSURL
        let dataURL = URL(string: url)! //change the url

        //create the session object
        let session = URLSession.shared

        //now create the URLRequest object using the url object
        let request = URLRequest(url: dataURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)

        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                completion(Result.failure(APPError.networkError(error!)))
                return
            }

            guard let data = data else {
                completion(Result.failure(APPError.dataNotFound))
                return
            }
            
            completion(Result.success(data))
        })

        task.resume()
    }
}
