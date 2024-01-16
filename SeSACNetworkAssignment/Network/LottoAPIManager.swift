//
//  LottoAPIManager.swift
//  SeSACNetworkAssignment
//
//  Created by 김진수 on 1/16/24.
//

import Foundation
import Alamofire

struct Lotto: Decodable {
    let drwNoDate: String
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
}

struct LottoAPIManager {
    
    func callResponse(number: Int, completionHandler: @escaping ([Int]) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(number)"
        
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let success):
                let numberArray: [Int] = [success.drwtNo1, success.drwtNo2, success.drwtNo3, success.drwtNo4, success.drwtNo5, success.drwtNo6, success.bnusNo]
                completionHandler(numberArray)
            case .failure(let failure):
                print("error")
            }
        }
    }
}
