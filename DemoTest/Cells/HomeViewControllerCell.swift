//
//  HomeViewControllerCell.swift
//  DemoTest
//
//  Created by Israrul on 6/30/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell {

    var albumImageView:UILabel = UILabel()
    var nameLbl:UILabel = UILabel()
    var titleLbl:UILabel = UILabel()
    var magLbl:UILabel = UILabel()
    var placeLbl:UILabel = UILabel()
    var magTypeLbl:UILabel = UILabel()
    var timeLbl:UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    func configureUI() {
        
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(nameLbl)
        self.contentView.addSubview(titleLbl)
        self.contentView.addSubview(magLbl)
        self.contentView.addSubview(magTypeLbl)
        self.contentView.addSubview(placeLbl)
        self.contentView.addSubview(timeLbl)

        nameLbl.numberOfLines = 0
        titleLbl.numberOfLines = 0
        albumImageView.numberOfLines = 0
        timeLbl.font = .systemFont(ofSize: 12)
        placeLbl.font = .systemFont(ofSize: 12)
        titleLbl.font = .systemFont(ofSize: 14)
        magLbl.font = .systemFont(ofSize: 12)
        albumImageView.font = .systemFont(ofSize: 12)
        albumImageView.textAlignment = .center
        magTypeLbl.font = .systemFont(ofSize: 12)
        nameLbl.font = .systemFont(ofSize: 12)
        magLbl.numberOfLines = 0
        magTypeLbl.numberOfLines = 0
        placeLbl.numberOfLines = 0
        timeLbl.numberOfLines = 0
        albumImageView.backgroundColor = UIColor.yellow

        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        magLbl.translatesAutoresizingMaskIntoConstraints = false
        magTypeLbl.translatesAutoresizingMaskIntoConstraints = false
        placeLbl.translatesAutoresizingMaskIntoConstraints = false
        timeLbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        UIView.setConstraints(for:albumImageView, toParent: self.contentView, leading:20.0, height:100.0, width:100.0,hasTrailing:false, hasTop:false, hasBottom:false, hasCenterY:true)

        
        titleLbl.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:20.0).isActive = true
        titleLbl.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10.0).isActive = true
        titleLbl.topAnchor.constraint(equalTo:self.albumImageView.topAnchor, constant:-10.0).isActive = true
        
        titleLbl.setContentHuggingPriority(UILayoutPriority.defaultHigh, for: NSLayoutConstraint.Axis.vertical)
        
        nameLbl.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:20.0).isActive = true
        nameLbl.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10.0).isActive = true
        nameLbl.topAnchor.constraint(equalTo:self.titleLbl.bottomAnchor, constant:2.0).isActive = true
        
        nameLbl.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
        
        magLbl.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:20.0).isActive = true
        magLbl.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10.0).isActive = true
        magLbl.topAnchor.constraint(equalTo:self.nameLbl.bottomAnchor, constant:2.0).isActive = true
        
        magLbl.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
        
        magTypeLbl.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:20.0).isActive = true
        magTypeLbl.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10.0).isActive = true
        magTypeLbl.topAnchor.constraint(equalTo:self.magLbl.bottomAnchor, constant:2.0).isActive = true
        
        magTypeLbl.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
        
        placeLbl.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:20.0).isActive = true
        placeLbl.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10.0).isActive = true
        placeLbl.topAnchor.constraint(equalTo:self.magTypeLbl.bottomAnchor, constant:2.0).isActive = true
        
        placeLbl.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
        
        
        timeLbl.leadingAnchor.constraint(equalTo:self.albumImageView.trailingAnchor, constant:20.0).isActive = true
        timeLbl.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:10.0).isActive = true
        timeLbl.topAnchor.constraint(equalTo:self.placeLbl.bottomAnchor, constant:2.0).isActive = true
        
        timeLbl.setContentHuggingPriority(UILayoutPriority.defaultLow, for: NSLayoutConstraint.Axis.vertical)
    }

}
