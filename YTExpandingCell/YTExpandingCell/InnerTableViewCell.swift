//
//  InnerTableViewCell.swift
//  YTExpandingCell
//
//  Created by Morse on 9/24/22.
//

import UIKit

class InnerTableViewCell: UITableViewCell {
    static let reuseIdentifier = "innerCell"
    
    let tableView = UITableView(frame: .zero, style: .plain)
    var things = ["Thing 1", "Thing 2", "Thing 3", "Thing 4", "Thing 5"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: InnerTableViewCell.reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.dragDelegate = self
        
        contentView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            heightAnchor.constraint(equalToConstant: 220)
        ])
        
        tableView.reloadData()
    }
}

extension InnerTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = things[indexPath.row]

        return cell
    }
}

extension InnerTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedCell = things.remove(at: sourceIndexPath.row)
        things.insert(movedCell, at: destinationIndexPath.row)
    }
}

extension InnerTableViewCell: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        guard indexPath.row != 0 else { return [] }
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        let object = things[indexPath.row]
        dragItem.localObject = object
        return [dragItem]
    }
}
