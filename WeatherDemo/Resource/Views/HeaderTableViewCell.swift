//
//  HeaderTableViewCell.swift
//  WeatherDemo
//
//  Created by 赵晓东 on 16/5/12.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    var Label_City:UILabel!
    
    var Label_Weather:UILabel!
    
    var Label_Temp:UILabel!
    
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func prepareUI() {
    
        self.Label_City = createLabel(CGRect(x: 0, y: 0, width: WIDTH, height: 50), Font: 30, Text: "城市名称简称")
        self.Label_City.textAlignment = NSTextAlignment.Center
        self.Label_City.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_City)
        
        
        self.Label_Weather = createLabel(CGRect(x: 0, y: CGRectGetMaxY(self.Label_City.frame), width: WIDTH, height: 20), Font: 13, Text: "天气状况")
        self.Label_Weather.textAlignment = NSTextAlignment.Center
        self.Label_Weather.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Weather)
        
        
        self.Label_Temp = createLabel(CGRect(x: 0, y: CGRectGetMaxY(self.Label_Weather.frame), width: WIDTH, height: 60), Font: 70, Text: "27℃")
        self.Label_Temp.textAlignment = NSTextAlignment.Center
        self.Label_Temp.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Temp)
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
