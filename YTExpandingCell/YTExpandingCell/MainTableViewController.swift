//
//  MainTableViewController.swift
//  YTExpandingCell
//
//  Created by Morse on 9/24/22.
//

import UIKit

struct cellData {
    var opened: Bool
    var title: String
}

class MainTableViewController: UITableViewController {
    
    var tableViewData: [cellData] = [
        cellData(opened: false, title: "1"),
        cellData(opened: false, title: "2"),
        cellData(opened: false, title: "3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(InnerTableViewCell.self, forCellReuseIdentifier: InnerTableViewCell.reuseIdentifier)
        tableView.allowsSelection = true
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened {
            return 2
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InnerTableViewCell.reuseIdentifier) as? InnerTableViewCell else { return UITableViewCell() }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 75
        } else {
            return 220
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            tableViewData[indexPath.section].opened.toggle()
            let sections = IndexSet(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            // Do whatever needs to be done when tapping on a sub-cell here.
        }
    }
}
