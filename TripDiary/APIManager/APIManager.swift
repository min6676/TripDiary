//
//  APIManger.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/19.
//

import Foundation
import Alamofire

enum APIError: Error {
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIError>) -> Void

class APIManger {
    static let shareInstance = APIManger()
    
    func callingRegisterAP(register: RegisterModel, completionHandler: @escaping (Bool, String) -> ()) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(K.register_url, method: .post, parameters: register, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case .success(let data):
                do {
                    print(data!)
                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    print(json)
                    if response.response?.statusCode == 200 {
                        completionHandler(true, "회원가입을 성공했습니다")
                    } else if response.response?.statusCode == 409 {
                        completionHandler(false, "이미 존재하는 아이디입니다")
                    } else {
                        completionHandler(false, "다시 시도해주세요")
                    }
                } catch {
                    print(error.localizedDescription)
                    completionHandler(false, "다시 시도해주세요")
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(false, "회원가입을 실패했습니다")
            }
        }
    }
    
    func callingLoginAP(login: LoginModel, completionHandler: @escaping Handler) {
        let headers: HTTPHeaders = [
            .contentType("application/json")
        ]
        AF.request(K.login_url, method: .post, parameters: login, encoder: JSONParameterEncoder.default, headers: headers).response{ response in
            debugPrint(response)
            switch response.result{
            case .success(let data):
                do {
                    let json = try JSONDecoder().decode(ResponseModel.self, from: data!)
//                    print(json)
//                    let json = try JSONSerialization.jsonObject(with: data!, options: [])
                    if response.response?.statusCode == 200 {
                        completionHandler(.success(json))
                    } else {
                        completionHandler(.failure(.custom(message: "네트워크 연결을 확인하세요.")))
                    }
                } catch {
                    print(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "다시 시도해주세요.")))
                }
            case .failure(let err):
                print(err.localizedDescription)
                completionHandler(.failure(.custom(message: "다시 시도해주세요.")))
            }
        }
    }
}
