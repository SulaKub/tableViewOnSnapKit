//
//  DetailViewController.swift
//  snapkit_tableview
//
//  Created by Sultan Kubentayev on 28/08/2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imageView1: UIImageView = {
        let iv = UIImageView ()
        iv.image = UIImage(named: "")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    func setupViews(){
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView1)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
    }
    
    func setupConstraints(){
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        imageView1.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top) // Измените на contentView, чтобы изображение находилось внутри contentView
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalTo(imageView1.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
        }
        
        subtitleLabel.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(30)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
