//
//  AttachTableViewCell.swift
//  WeatherDemo
//
//  Created by 赵晓东 on 16/5/12.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class AttachTableViewCell: UITableViewCell {
    
    var Humid:UILabel!
    
    var Label_Humid:UILabel!
    
    var Wind:UILabel!
    
    var Label_Wind:UILabel!
    
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func prepareUI() {
        
        self.Humid = createLabel(CGRect(x: 15, y: 0, width: (WIDTH-30)/2, height: 44), Font: 17, Text: "湿度：")
        self.Humid.textAlignment = NSTextAlignment.Right
        self.Humid.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Humid)
        
        
        self.Label_Humid = createLabel(CGRect(x: CGRectGetMaxX(self.Humid.frame), y: 0, width: (WIDTH-30)/2, height: 44), Font: 17, Text: "0")
        self.Label_Humid.textAlignment = NSTextAlignment.Left
        self.Label_Humid.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Humid)
        
        
        
        self.Wind = createLabel(CGRect(x: 15, y: CGRectGetMaxY(self.Humid.frame), width: (WIDTH-30)/2, height: 44), Font: 17, Text: "风力：")
        self.Wind.textAlignment = NSTextAlignment.Right
        self.Wind.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Wind)
        
        
        self.Label_Wind = createLabel(CGRect(x: CGRectGetMaxX(self.Humid.frame), y: CGRectGetMaxY(self.Humid.frame), width: (WIDTH-30)/2, height: 44), Font: 17, Text: "0")
        self.Label_Wind.textAlignment = NSTextAlignment.Left
        self.Label_Wind.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Wind)
        
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
