//
//  ViewController.swift
//  TaskURLSession
//
//  Created on 16/01/24.
//

import UIKit

class ViewController: UIViewController {
    //https://jsonplaceholder.typicode.com/posts
    
    private lazy var tblView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register( UINib(nibName: TestCell.className, bundle: nil), forCellReuseIdentifier: TestCell.className)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorColor = .gray
        return table
    }()
    
    var mainData = [DataModel](){
        didSet{
            DispatchQueue.main.async { [self] in
                tblView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews(){
        self.view.backgroundColor = .white
        self.view.addSubview(tblView)
        tblView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        tblView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tblView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        APIManager.shared.getData(completionBlock: { [self]
            data in
            mainData = data
        })

    }
    
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.className, for: indexPath) as! TestCell
        cell.selectionStyle = .none
        cell.configure(model: mainData[indexPath.row])
        return cell
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index",indexPath.row)
    }
}



