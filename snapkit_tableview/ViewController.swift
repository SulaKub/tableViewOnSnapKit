//
//  ViewController.swift
//  snapkit_tableview
//
//  Created by Sultan Kubentayev on 28/08/2024.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayItems = [
        Items(title: "Школа архитектуры и планирования", subtitle: "Групп 49", 
              shortDesctiption: """
              🎯  Архитектура
              
              🎯  Городские исследования и планирование
              
              🎯  Media Lab
              
              🎯  Center for Real Estate
              """,
              imageFacultacy: "mit.logo", imageSpecialization: "f1"),
        Items(title: "Школа инженерии", subtitle: "Групп 52",
              shortDesctiption: """
🎯  Аэрокосмическая и астронавтика

🎯  Биологическая инженерия

🎯  Химическая инженерия

🎯  Гражданское и экологическое строительство

🎯  Электротехника и компьютерные науки

🎯  Инженерные системы и дизайн

🎯  Материаловедение и инженерия

🎯  Машиностроение

🎯  Ядерная наука и инженерия (Nuclear Science and Engineering)
""", imageFacultacy: "mit.logo", imageSpecialization: "f2"),
        Items(title: "Школа гуманитарных, искусств и социальных наук", subtitle: "Групп 16", shortDesctiption: """
🎯  Антропология

🎯  Сравнительное медиа

🎯  Экономика

🎯  История

🎯  Лингвистика и философия

🎯  Литература

🎯  Музыка и театр

🎯  Политические науки

🎯  Науки о мозге и когнитивные науки

🎯  Письмо и гуманитарные науки
""", imageFacultacy: "mit.logo", imageSpecialization: "f3"),
        Items(title: "Школа менеджмента имени Слоана", subtitle: "Групп 29", shortDesctiption: """
🎯  Программы MBA и Executive MBA

🎯  Магистратура по финансам

🎯  Программы магистратуры в области бизнес-аналитики

🎯  Программы PhD в области менеджмента и других дисциплин

🎯  Программы для руководителей и программы непрерывного образования

""", imageFacultacy: "mit.logo", imageSpecialization: "f4"),
        Items(title: "Школа наук", subtitle: "Групп 36", shortDesctiption: """
🎯  Биология

🎯  Химия

🎯  Математика

🎯  Физика

🎯  Науки о Земле, атмосфере и планетах

🎯  Науки о мозге и когнитивные науки
""", imageFacultacy: "mit.logo", imageSpecialization: "f5"),
    ]
    
    var tableView: UITableView = {
        let tv = UITableView()
        tv.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.backgroundColor = .white
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .red
        setupUI()
        setupConstraints()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    func setupUI() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(barButtonTapped))
        navigationItem.title = "Факультеты MIT"
        view.backgroundColor = .white
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.bottom.top.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    @objc
    func barButtonTapped(){
        arrayItems.append(Items(title: "Новая Школа", subtitle: "Количество групп", imageFacultacy: "mit.logo", imageSpecialization: "mit.logo"))
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удаление элемента из массива данных
            arrayItems.remove(at: indexPath.row)
            
            // Удаление строки из таблицы с анимацией
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.titleLabel.text = arrayItems[indexPath.row].title
        cell.subtitleLabel.text = arrayItems[indexPath.row].subtitle
        cell.imageView1.image = UIImage(named: arrayItems[indexPath.row].imageFacultacy)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        detailVC.titleLabel.text=arrayItems[indexPath.row].title
        detailVC.subtitleLabel.text=arrayItems[indexPath.row].shortDesctiption
        detailVC.imageView1.image=UIImage(named: arrayItems[indexPath.row].imageSpecialization)
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

