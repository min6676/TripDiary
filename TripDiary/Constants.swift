//
//  Constants.swift
//  TripDiary
//
//  Created by 김민순 on 2021/01/17.
//

struct K {
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "ContentCell"
    static let loginSegue = "LoginToContent"
    static let registerSegue = "RegisterToContent"
    static let app_id = "B037284F-6ACC-088A-FF95-9A6C4076DE00"
    static let rest_key = "8B331679-1D1B-43EF-8514-C9D27ACE1CDC"
    static let base_url = "https://api.backendless.com/\(app_id)/\(rest_key)/users/"
    static let register_url = "\(base_url)register"
    static let login_url = "\(base_url)login"
}
