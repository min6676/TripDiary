//
//  LoginModel.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/20.
//

import Foundation

struct LoginModel: Encodable {
    let login : String
    let password : String
}

struct LoginResponseModel {
    let id: String
}
