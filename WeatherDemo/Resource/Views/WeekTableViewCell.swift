//
//  WeekTableViewCell.swift
//  WeatherDemo
//
//  Created by 赵晓东 on 16/5/12.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class WeekTableViewCell: UITableViewCell {
    
    var Label_Week:UILabel!
    
    var Label_Today:UILabel!
    
    var ImageView_Icon:UIImageView!
    
    var Label_HighTemp:UILabel!
    
    var Label_LowTemp:UILabel!
    
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() {
        
        self.Label_Week = createLabel(CGRect(x: 0, y: 0, width: WIDTH/5, height: 44), Font: 17, Text: "星期")
        self.Label_Week.textAlignment = NSTextAlignment.Center
        self.Label_Week.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Week)
        
        
        self.Label_Today = createLabel(CGRect(x: WIDTH/5, y: 0, width: WIDTH/5, height: 44), Font: 17, Text: "今天")
        self.Label_Today.textAlignment = NSTextAlignment.Center
        self.Label_Today.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Today)
        
        
        self.ImageView_Icon = createImageView(CGRect(x: WIDTH/5*2, y: (44-30)/2, width: 50, height: 30), ImageName: "")
        self.Label_Week.textAlignment = NSTextAlignment.Center
        self.contentView.addSubview(self.ImageView_Icon)
        
        
        self.Label_HighTemp = createLabel(CGRect(x: WIDTH/5*3, y: 0, width: WIDTH/5, height: 44), Font: 17, Text: "0℃")
        self.Label_HighTemp.textAlignment = NSTextAlignment.Center
        self.Label_HighTemp.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_HighTemp)
        
        
        self.Label_LowTemp = createLabel(CGRect(x: WIDTH/5*4, y: 0, width: WIDTH/5, height: 44), Font: 17, Text: "0℃")
        self.Label_LowTemp.textAlignment = NSTextAlignment.Center
        self.Label_LowTemp.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_LowTemp)
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
