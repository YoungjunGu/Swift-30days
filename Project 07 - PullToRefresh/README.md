# UIRefreshControl

list 형식의 TableView를 새로 고침 할 때 iOS에서는 버튼을 사용자가 누르게끔 유도하여 새로고침 할 수 있지만 아래로 당기는 제스처를 이용하여 새로고침을 하는 방식을 가장 많이 사용한다.  


## UIRefreshControl의 내부  

<img width="822" alt="image" src="https://user-images.githubusercontent.com/33486820/65045850-80c38900-d99a-11e9-9d4a-933606ae65f5.png">
 
  
  
- iOS 6.0 버전 이상부터 지원이 가능하고 UIControl을 상속받고있다.  
- 내부 프로퍼티로는 `isRefreshing`이 있고 이는 말 그대로 현재 refresh가 진행중인지를 나타내고있다.
- `tintColor`를 통해 기존의 제공하는 refresh 의 색상또한 변경이 가능하다. 
- `attributedTitle`은 새로고침 indicator아래에 텍스트 등을 설정한다.
- `beingRefreshin`함수는 새로고침 시작을 알린다.
- `endRefreshing`함수는 새로고침이 끝났음을 알린다.  

## UIRefresh의 전체적인 구조

```swift
//
//  ViewController.swift
//  PullToRefresh
//
//  Created by youngjun goo on 17/09/2019.
//  Copyright © 2019 youngjun goo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var index = 0
    let cellIdentifer = "NewCellIdentifier"

    var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // code로 TableView 생성
        tableView = UITableView(frame: self.view.bounds, style: .plain)
       
        // 버전 10 이전은 TableView에 view를 더해주는 방식을 채택하고 있다. 
        if #available(iOS 10.0, *) {
            tableView.refreshControl = self.refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }

        self.refreshControl.addTarget(self, action: #selector(ViewController.updateTableView), for: .valueChanged)
       
        // refresh 인디케이터 아래 텍스트 설명을 추가
        self.refreshControl.attributedTitle = NSAttributedString(string: "Last updated on \(Date())", attributes: attributes)
        // refresh 인디케이터의 색상설정
        self.refreshControl.tintColor = UIColor.white
       

    }
    
    //UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiData.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer)! as UITableViewCell

        return cell
    }
    
    
   
    
    @objc func updateTableView() {
        DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 3 ) {

            // refresh 종료
            self.refreshControl.endRefreshing()
            // tableView 새로 고침
            self.tableView.reloadData()

        }
    }
    
}

```




