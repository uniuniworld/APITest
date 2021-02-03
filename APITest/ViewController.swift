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

struct DataModel: Codable {
    let getUserInfo: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    private var addresses: AddressModel?
    private var dataModel: DataModel?
    
    var scheduleData: ScheduleData?
    var schedule: [Schedule]?
    
    var requestData: [Request]?
    
    var labelText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pushedButton(_ sender: Any) {
        
        getScheduleData(urll: URL(string: "http://127.0.0.1:8010/ios/schedule/")!)
        
    }
    
    private func getScheduleData(urll: URL) {
        
        // URLを生成
        let url = urll
        // Requestを生成
        let request = URLRequest(url: url)
        // API呼び出し時の認証用Headerキーを追加する
        //        request.addValue("AUTH_API_KEY_20181203", forHTTPHeaderField: "H-API-KEY")
        //
        //request.httpMethod = HttpMethodType
        // 非同期でAPI通信を行う
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(ScheduleData.self, from: data)
//                print(response.data)
                self.schedule = response.data?.years?[0].months?[0].days?[0].schedules
                print(self.schedule)
                print()
                DispatchQueue.main.async {
                    
                    for str in self.schedule! {
                        print(str)
                    }
                    
                    self.schedule?.count
                    self.schedule?[0].clinicName
                    
                    
                }
            } catch let error {
                print(error)
                print("えらーーー")
            }
        }
        task.resume()
    }
    
    @IBAction func tapedButton(_ sender: Any) {
        
        //getData(url: URL(string: "http://127.0.0.1:8010/ios/init/")!)
        getRequestData(urll: URL(string: "http://127.0.0.1:8010/ios/request/")!)
        
        
        //getAddress(zipCode: "2790031")
        
    }
    
    private func getRequestData(urll: URL) {
        
        // URLを生成
        let url = urll
        // Requestを生成
        let request = URLRequest(url: url)
        // API呼び出し時の認証用Headerキーを追加する
        //        request.addValue("AUTH_API_KEY_20181203", forHTTPHeaderField: "H-API-KEY")
        //
        //request.httpMethod = HttpMethodType
        // 非同期でAPI通信を行う
        let task = URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            guard let data = data else { return }
            do {
//                print(data)
//                print(urlResponse)
                let response = try JSONDecoder().decode(RequestData.self, from: data)
//                print(response.data)
                self.requestData = response.data
                print(self.requestData)
                print()
                DispatchQueue.main.async {
                    
                    for str in self.requestData! {
                        print(str)
                    }
                    
                    self.requestData?.count
                    self.requestData?[0].postalCode
                    
                    
                }
            } catch let error {
                print(error)
                print("えらーーー")
            }
        }
        task.resume()
    }
    
    private func getData(url: URL) {
        //Requestを生成
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in  //非同期で通信を行う
            guard let data = data else { return }
            do {
                //DataをJsonに変換
                let object = try JSONSerialization.jsonObject(with: data, options: [])
                print(object)
                print("==============object====================")
                print(type(of: object))
                
                //                self.dataModel = try JSONDecoder().decode(DataModel.self, from: data)
                //                print("==============self.dataModel====================")
                //                print(self.dataModel ?? "dataModelがnilだったよ")
                //                print(type(of: self.dataModel))
                //
                //                print("==============self.dataModel?.getUserInfo====================")
                //                print(self.dataModel?.getUserInfo ?? "getUserInfoがnilだったよ")
                //                print(type(of: self.dataModel?.getUserInfo))
                
                // main threadで実行
                DispatchQueue.main.sync {
                    //                    self.label.text = String(self.object)
                    //                    self.label.text = self.dataModel?.getUserInfo
                }
                
            } catch let error {
                print(error)
            }
            //            self.label.text = self.dataModel?.getUserInfo
            //            self.label.text = self.labelText
            //            print(self.labelText)
            //            print(self.dataModel?.getUserInfo)
            
        }
        
        task.resume()
        
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
    
    //    static func fetchArticle(completion: @escaping ([QiitaStruct]) -> Swift.Void) {
    //
    //        let url = "https://qiita.com/api/v2/items"
    //
    //        guard var urlComponents = URLComponents(string: url) else {
    //            return
    //        }
    //
    //        urlComponents.queryItems = [
    //            URLQueryItem(name: "per_page", value: "50"),
    //        ]
    //
    //        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
    //
    //            guard let jsonData = data else {
    //                return
    //            }
    //
    //            do {
    //                let articles = try JSONDecoder().decode([QiitaStruct].self, from: jsonData)
    //                completion(articles)
    //            } catch {
    //                print(error.localizedDescription)
    //            }
    //        }
    //        task.resume()
    //    }
    //
}
//
//[APITest.ScheduleData(data: Optional(APITest.Years(years: Optional([APITest.Year(year: Optional("2021"), months: Optional([APITest.Month(month: Optional("02"), days: Optional([APITest.Day(day: Optional("01"), dayOfTheWeek: Optional("月"), schedules: Optional([])), APITest.Day(day: Optional("02"), dayOfTheWeek: Optional("火"), schedules: Optional([])), APITest.Day(day: Optional("03"), dayOfTheWeek: Optional("水"), schedules: Optional([])), APITest.Day(day: Optional("04"), dayOfTheWeek: Optional("木"), schedules: Optional([])), APITest.Day(day: Optional("05"), dayOfTheWeek: Optional("金"), schedules: Optional([])), APITest.Day(day: Optional("06"), dayOfTheWeek: Optional("土"), schedules: Optional([])), APITest.Day(day: Optional("07"), dayOfTheWeek: Optional("日"), schedules: Optional([])), APITest.Day(day: Optional("08"), dayOfTheWeek: Optional("月"), schedules: Optional([APITest.Schedule(urgency: nil, scheduleType: Optional("1"), allDayType: Optional("0"), startTime: Optional("2021-02-08T00:00:00"), endTime: Optional("2021-02-08T00:00:00"), title: Optional("休日対応"), content: Optional("説明テキスト変更3"), clinicName: Optional("栄管サポートクリニック"), facilityName: Optional("施設"), facilityLatitude: Optional("35.126303"), facilityLongitude: Optional("136.88162"), facilityPostalCode: Optional("4540054"), facilityAddress: Optional("愛知県名古屋市中川区八剱町"), updater: nil, updateDayTime: Optional("2020-12-16T17:32:28.371")), APITest.Schedule(urgency: nil, scheduleType: Optional("0"), allDayType: Optional("0"), startTime: Optional("2021-02-08T00:00:00"), endTime: Optional("2021-02-08T00:00:00"), title: Optional("電話（涌井 和毅 ）"), content: nil, clinicName: nil, facilityName: Optional("施設"), facilityLatitude: Optional("35.011587"), facilityLongitude: Optional("135.776496"), facilityPostalCode: nil, facilityAddress: Optional("京都府京都市左京区福本町４１７−３ AAAアカデミー"), updater: nil, updateDayTime: Optional("2020-12-17T19:21:59.693")), APITest.Schedule(urgency: nil, scheduleType: Optional("1"), allDayType: Optional("0"), startTime: Optional("2021-02-08T00:00:00"), endTime: Optional("2021-02-08T00:00:00"), title: Optional("休日対応"), content: Optional("説明テキスト変更4"), clinicName: nil, facilityName: nil, facilityLatitude: nil, facilityLongitude: nil, facilityPostalCode: nil, facilityAddress: nil, updater: nil, updateDayTime: Optional("2020-12-16T17:37:06.617")), APITest.Schedule(urgency: nil, scheduleType: Optional("0"), allDayType: Optional("0"), startTime: Optional("2021-02-08T00:00:00"), endTime: Optional("2021-02-08T00:00:00"), title: Optional("銀行振り込み（木下真央）"), content: nil, clinicName: nil, facilityName: nil, facilityLatitude: nil, facilityLongitude: nil, facilityPostalCode: nil, facilityAddress: nil, updater: nil, updateDayTime: Optional("2020-12-17T17:45:42.945"))])), APITest.Day(day: Optional("09"), dayOfTheWeek: Optional("火"), schedules: Optional([])), APITest.Day(day: Optional("10"), dayOfTheWeek: Optional("水"), schedules: Optional([])), APITest.Day(day: Optional("11"), dayOfTheWeek: Optional("木"), schedules: Optional([])), APITest.Day(day: Optional("12"), dayOfTheWeek: Optional("金"), schedules: Optional([])), APITest.Day(day: Optional("13"), dayOfTheWeek: Optional("土"), schedules: Optional([])), APITest.Day(day: Optional("14"), dayOfTheWeek: Optional("日"), schedules: Optional([])), APITest.Day(day: Optional("15"), dayOfTheWeek: Optional("月"), schedules: Optional([])), APITest.Day(day: Optional("16"), dayOfTheWeek: Optional("火"), schedules: Optional([])), APITest.Day(day: Optional("17"), dayOfTheWeek: Optional("水"), schedules: Optional([])), APITest.Day(day: Optional("18"), dayOfTheWeek: Optional("木"), schedules: Optional([])), APITest.Day(day: Optional("19"), dayOfTheWeek: Optional("金"), schedules: Optional([])), APITest.Day(day: Optional("20"), dayOfTheWeek: Optional("土"), schedules: Optional([])), APITest.Day(day: Optional("21"), dayOfTheWeek: Optional("日"), schedules: Optional([])), APITest.Day(day: Optional("22"), dayOfTheWeek: Optional("月"), schedules: Optional([])), APITest.Day(day: Optional("23"), dayOfTheWeek: Optional("火"), schedules: Optional([])), APITest.Day(day: Optional("24"), dayOfTheWeek: Optional("水"), schedules: Optional([])), APITest.Day(day: Optional("25"), dayOfTheWeek: Optional("木"), schedules: Optional([])), APITest.Day(day: Optional("26"), dayOfTheWeek: Optional("金"), schedules: Optional([])), APITest.Day(day: Optional("27"), dayOfTheWeek: Optional("土"), schedules: Optional([])), APITest.Day(day: Optional("28"), dayOfTheWeek: Optional("日"), schedules: Optional([]))]))]))]))))]
