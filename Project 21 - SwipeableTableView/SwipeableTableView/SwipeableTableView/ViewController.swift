//
//  ViewController.swift
//  SwipeableTableView
//
//  Created by youngjun goo on 2019/10/13.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

private struct TableConstant {
    static let sectionNumber: Int = 4
    static let heightForRowAt: CGFloat = 60
    static let identifier: String = "SwipeCell"
}

class ViewController: UITableViewController {
    
    let sectionNumber: Int = 4
    
    var tableData = [
        CellData(image: "1", name: "cell number 1"),
        CellData(image: "2", name: "cell number 2"),
        CellData(image: "3", name: "cell number 3"),
        CellData(image: "4", name: "cell number 4"),
        CellData(image: "5", name: "cell number 5"),
        CellData(image: "6", name: "cell number 6"),
        CellData(image: "7", name: "cell number 7")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // section당 cell의 개수를 설정
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return TableConstant.sectionNumber
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableConstant.heightForRowAt
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableConstant.identifier, for: indexPath) as? SwipeTableViewCell else {
            return UITableViewCell()
        }
        
        let cellData = tableData[indexPath.row]
        
        cell.cellNameLabel.text = cellData.name
        cell.cellImageView.image = UIImage(named: cellData.image)
        
        return cell
    }
    
    // iOS 13 부터 editActionsForRowAt 함수 대신 trailingSwipeActionsConfigurationForRowAt 로 대체
//    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
//    }
    
    // TableViewCell의  오른쪽(trailing) 을 스와이프 했을때 대응 왼쪽은 leading
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .normal, title: "삭제") { (ca, view, success: (Bool) -> Void) in
            success(true)
            print("Delete button tapped")
        }
        
        delete.backgroundColor = UIColor.gray
        
        let share = UIContextualAction(style: .normal, title: "공유") { (ca, view, success: (Bool) -> Void) in
            
            let firstActivityItem = self.tableData[indexPath.row]
             let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
             
             self.present(activityViewController, animated: true, completion: nil)
            success(true)
            print("Share button tapped")
        }
        
        share.backgroundColor = UIColor.red
        
        let downLoad = UIContextualAction(style: .normal, title: "다운로드") { (ca, view, success: (Bool) -> Void) in
            print("DownLoad button tapped")
        }
        
        downLoad.backgroundColor = UIColor.blue
        
        return UISwipeActionsConfiguration(actions: [delete, share, downLoad])
    }
    
    // tableView의 edit 을 허용하는 필수 호출 함수
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            print("Delete")
        case .insert:
            print("Insert")
        case .none:
            print("None")
        @unknown default:
            print("default")
        }
    }
    
    
}

