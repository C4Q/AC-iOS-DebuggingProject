//
//  ElementAPIClient.swift
//  MidtermElements-InstructorNotes
//
//  Created by C4Q  on 12/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct ElementAPIClient {
    private init(){}
    static let shared = ElementAPIClient()
    func getElements(from urlStr: String,
                   completionHandler: @escaping ([Element]) -> Void,
                   errorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else {return}
        let completion: (Data) -> Void = {(data: Data) in
            do {
                let elements = try JSONDecoder().decode([Element].self, from: data)
            }
            catch {
                print(error)
            }
        }
        NetworkHelper.manager.performDataTask(with: URLRequest(url: url),
                                              completionHandler: completion,
                                              errorHandler: errorHandler)
    }
}
