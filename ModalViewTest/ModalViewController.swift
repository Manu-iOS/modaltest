//
//  ModalViewController.swift
//  ModalViewTest
//
//  Created by 노민우 on 2023/07/06.
//

import Foundation


// MARK: - PreView 읽기
import SwiftUI

class ModalViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        var table = UITableView(frame: CGRectZero, style: .insetGrouped)
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .blue
        setupTableViewConstraints()
    }
    
    func setupTableViewConstraints() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension ModalViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "몇번째 row: \(indexPath.row)"
        return cell
    }
    
}

#if DEBUG
struct PreView1: PreviewProvider {
    static var previews: some View {
        // 사용할 뷰 컨트롤러를 넣어주세요
        ViewController()
            .toPreview()
    }
}
#endif
