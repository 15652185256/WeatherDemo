//
//  NetRequestClass.swift
//  WeatherDemo
//
//  Created by 赵晓东 on 16/5/12.
//  Copyright © 2016年 ZXD. All rights reserved.
//

enum NetworkHelper {
    //根网址
    static let baseUrl = " http://api.k780.com:88/"
    
    //固定参数
    static var params = [
        "app":"weather.future",
        "appkey":"10003",
        "sign":"b59bc3ef6191eb9f747dd4e83c99f2a4",
        "format":"json",
    ]
    
    //可变参数
    case WeeklyWeather(cityid: String)
    
    
    
    //请求成功
    func getWeather(completion:([Result]?, String?) -> Void) {
        
        var error: String?
        
        var results: [Result]?
        
        switch self {
            
        case .WeeklyWeather(cityid: let weaid):
            
            NetworkHelper.params["weaid"] = weaid
            
            let manager = AFHTTPSessionManager()
            
            //请求格式
            manager.requestSerializer = AFJSONRequestSerializer()
            
            //返回格式
            manager.responseSerializer = AFJSONResponseSerializer()
            
            let urlStr = "http://api.k780.com:88/?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"
            
            manager.GET(urlStr, parameters: "", progress: { (uploadProgress: NSProgress!) -> Void in
                
                }, success: { (dataTask: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
                    
                    if ((responseObject!.description) != nil) {
                        
                        //print(responseObject!.description)
                        
                        let jsonDict = responseObject as! NSDictionary
                        
                        //print(jsonDict)
                        
                        let weather = RootClass(fromDictionary:jsonDict)
                        
                        results = weather.result
                        
                    } else {
                        error = "服务器出错"
                    }
                    
                    completion(results, error)
                    
                }) { (dataTask: NSURLSessionDataTask?, error: NSError) -> Void in
                    
                    print("Error: " + error.localizedDescription)
            }
            
            break
        }
    }
    
}
