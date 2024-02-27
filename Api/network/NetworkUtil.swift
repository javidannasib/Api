//
//  NetworkUtil.swift
//  Api
//
//  Created by Javidan Nasib on 27.02.24.
//

import UIKit

class NetworkUtil: NSObject {
    
}

enum HttpMethod : String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
}

enum NetworkError : Error {
    case InvalidURL
    case noData
    case decodingError
    case httpResponseError(statusCode : Int)
    case unknown(Error)
}
