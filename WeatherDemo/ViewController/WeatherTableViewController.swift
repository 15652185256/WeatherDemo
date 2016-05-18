//
//  WeatherTableViewController.swift
//  WeatherDemo
//
//  Created by 赵晓东 on 16/5/12.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class WeatherTableViewController: UITableViewController {
    
    var sectionTitles = ["","一周天气预报","天气简报","其他数据"]
    
    var results: [Result] = []
    
    var result: [Result] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createView()
        
        self.loadData()
    }
    
    //创建页面
    func createView() {
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, WIDTH, HEIGHT), style: UITableViewStyle.Grouped)
        
        self.tableView!.registerClass(HeaderTableViewCell.self, forCellReuseIdentifier: "HeaderTableViewCell")
        
        self.tableView!.registerClass(WeekTableViewCell.self, forCellReuseIdentifier: "WeekTableViewCell")
        
        self.tableView!.registerClass(BriefTableViewCell.self, forCellReuseIdentifier: "BriefTableViewCell")
        
        self.tableView!.registerClass(AttachTableViewCell.self, forCellReuseIdentifier: "AttachTableViewCell")
    }
    
    
    //数据
    func loadData() {
        
        //北京的天气周报
        let weeklyWeatherBJ = NetworkHelper.WeeklyWeather(cityid: "1")
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        weeklyWeatherBJ.getWeather { (results, error) -> Void in
            
            //print(results)
            
            if let results = results{
                self.results = results
                self.result.append(results.first!)
                
                self.tableView.reloadData()
                
            } else {
                
                
            }
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section{
        case 1:
            return self.results.count
        default:
            return self.result.count
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sectionTitles[section]
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section{
        case 0:
            return 140
        case 3:
            return 88
        default:
            return 44
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cellID = ""
        let weather = self.result[0]
        
        
        switch indexPath.section {
        case 0:
            cellID = "HeaderTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! HeaderTableViewCell
            cell.Label_City.text = weather.citynm
            cell.Label_Temp.text = weather.tempHigh + "℃"
            cell.Label_Weather.text = weather.weather
            return cell
        case 1:
            cellID = "WeekTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! WeekTableViewCell
            let result = results[indexPath.row]
            if indexPath.row == 0 {
                cell.Label_Today.text = "今天"
            } else {
                cell.Label_Today.text = ""
            }
            cell.Label_Week.text = result.week
            cell.ImageView_Icon.sd_setImageWithURL(NSURL(string: result.weatherIcon))
            cell.Label_HighTemp.text = "\(result.tempHigh)℃"
            cell.Label_LowTemp.text = "\(result.tempLow)℃"
            return cell
        case 2:
            cellID = "BriefTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! BriefTableViewCell
            cell.Label_Brief.text = "\(weather.weather)。最高温：\(weather.tempHigh)℃。最低温：\(weather.tempLow)℃。"
            return cell
        case 3:
            cellID = "AttachTableViewCell"
            let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! AttachTableViewCell
            cell.Label_Wind.text = weather.wind
            cell.Label_Humid.text = weather.humidity
            return cell
        default:
            return UITableViewCell(frame: CGRectZero)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
