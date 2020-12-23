//
//  ViewController.swift
//  APITest
//
//  Created by t_kirifu on 2020/12/23.
//

import UIKit

struct AddressModel: Decodable {
    var results: [Result]
    
    struct Result: Decodable {
        var address1: String
        var address2: String
        var address3: String
        var kana1: String
        var kana2: String
        var kana3: String
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    private var addresses: AddressModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapedButton(_ sender: Any) {
        
        getAddress(zipCode: "2790031")
        
//        let url = URL(string: "https://hogehoge.hoge")!  //URLを生成
//        var request = URLRequest(url: url)               //Requestを生成
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
//            guard let data = data else { return }
//            do {
//                let object = try JSONSerialization.jsonObject(with: data, options: [])  // DataをJsonに変換
//                print(object)
//            } catch let error {
//                print(error)
//            }
//        }
//        task.resume()
    }
    
    private func getAddress(zipCode: String) {
        let baseUrlString = "http://zipcloud.ibsnet.co.jp/api/"
        let searchUrlString = "\(baseUrlString)search"
        let searchUrl = URL(string: searchUrlString)!
        guard var components = URLComponents(url: searchUrl, resolvingAgainstBaseURL: searchUrl.baseURL != nil) else {
            return
        }
        components.queryItems = [URLQueryItem(name: "zipcode", value: zipCode)] + (components.queryItems ?? [])
        var request = URLRequest(url: components.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let data = data else {
                return
            }
            do {
                self.addresses = try JSONDecoder().decode(AddressModel.self, from: data)
            } catch let error {
                print("Error: \(error)")
            }
        }.resume()
    }
    
    static func fetchArticle(completion: @escaping ([QiitaStruct]) -> Swift.Void) {

            let url = "https://qiita.com/api/v2/items"

            guard var urlComponents = URLComponents(string: url) else {
                return
            }

            urlComponents.queryItems = [
                URLQueryItem(name: "per_page", value: "50"),
            ]

            let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in

                guard let jsonData = data else {
                    return
                }

                do {
                    let articles = try JSONDecoder().decode([QiitaStruct].self, from: jsonData)
                    completion(articles)
                } catch {
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    
}

