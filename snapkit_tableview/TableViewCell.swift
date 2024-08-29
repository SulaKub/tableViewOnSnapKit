//
//  TableViewCell.swift
//  snapkit_tableview
//
//  Created by Sultan Kubentayev on 28/08/2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let identifier = "Cell"
    
    var imageView1: UIImageView = {
        let iv = UIImageView ()
        iv.image = UIImage(named: "")
        return iv
    } ()
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Sula"
        label.font = .systemFont(ofSize: 18, weight: .bold )
        label.textAlignment = .left
        return label
    } ()
    
    var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Kubentayev"
        label.font = .systemFont(ofSize: 16, weight: .semibold )
        label.textAlignment = .left
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    func setupViews(){
        contentView.addSubview(imageView1)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }
    
    func setupConstraints(){
        imageView1.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.left.equalTo(imageView1.snp.right).offset(8)
            make.top.right.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints{ make in
            make.left.equalTo(imageView1.snp.right).offset(8)
            make.bottom.equalToSuperview().inset(16)
        }
    }
}
