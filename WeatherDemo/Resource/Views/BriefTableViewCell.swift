//
//  BriefTableViewCell.swift
//  WeatherDemo
//
//  Created by 赵晓东 on 16/5/12.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class BriefTableViewCell: UITableViewCell {
    
    
    var Label_Today:UILabel!
    
    var Label_Brief:UILabel!
    
    
    // Class 初始化
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.prepareUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func prepareUI() {
        
        self.Label_Today = createLabel(CGRect(x: 15, y: 0, width: (WIDTH-30)/9, height: 44), Font: 16, Text: "今天")
        self.Label_Today.textAlignment = NSTextAlignment.Center
        self.Label_Today.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Today)
        
        
        self.Label_Brief = createLabel(CGRect(x: CGRectGetMaxX(self.Label_Today.frame), y: 0, width: (WIDTH-30)/9*8, height: 44), Font: 16, Text: "天气简报")
        self.Label_Brief.textAlignment = NSTextAlignment.Center
        self.Label_Brief.textColor = UIColor.grayColor()
        self.contentView.addSubview(self.Label_Brief)
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
