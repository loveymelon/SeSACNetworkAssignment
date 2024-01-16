//
//  BeerAPIManager.swift
//  SeSACNetworkAssignment
//
//  Created by 김진수 on 1/16/24.
//

import Foundation
import Alamofire

struct Beer: Decodable {
    let name: String
    let image_url: String
    let description: String
}

struct BeerAPIManager {
    func callResponse(completionHandler: @escaping ([Beer]) -> Void) {
        let url = "https://api.punkapi.com/v2/beers/random"
        
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let success):
                let beer = [Beer(name: success[0].name, image_url: success[0].image_url, description: success[0].description)]
                completionHandler(beer)
            case .failure(let failure):
                print(failure)
                print("error")
            }
        }
    }
    
    func callResponseTable(completionHandler: @escaping([Beer]) -> Void) {
        let url = "https://api.punkapi.com/v2/beers"
        
        AF.request(url).validate(statusCode: 200..<300).responseDecodable(of: [Beer].self) { response in
            switch response.result {
            case .success(let success):
                completionHandler(success)
            case .failure(let failure):
                print(failure)
                print("error")
            }
        }
    }
}
