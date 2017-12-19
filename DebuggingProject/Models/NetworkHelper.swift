//
//  NetworkHelper.swift
//  MidtermElements-InstructorNotes
//
//  Created by C4Q  on 12/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

enum AppError: Error {
    case badURL
    case codingError(rawError: Error)
    //Add more as required
}


class NetworkHelper {
    //Make it so we can't make NetworkHelpers outside this class
    private init() {}
    
    //Create a class property that we will use to get to instance methods
    static let manager = NetworkHelper()
    
    //Create a default URLSession
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    //Give the manager an instance method that takes a URL, completion handler and error handler.  After getting data from the URL, it runs the completion handler.
    func performDataTask(with request: URLRequest, completionHandler: @escaping (Data) -> Void, errorHandler: @escaping (Error) -> Void) {
        //Dispatch to the main queue
        
        //Create a dataTask
        self.urlSession.dataTask(with: request){(data: Data?, response: URLResponse?, error: Error?) in
            DispatchQueue.main.async {
                guard let data = data else {return} //Ensure the data is valid
                
                //Handle any errors
                if let error = error {
                    errorHandler(error)
                }
                
                //Input the data into the completion handler
                completionHandler(data)                
            }
        }
    }
}
