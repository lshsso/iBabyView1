//
//  imageListVC.swift
//  iBabyView1
//
//  Created by SSO on 10/11/2018.
//  Copyright © 2018 sso. All rights reserved.
//

import UIKit

class imageListVC: UITableViewController {
    
    
    @IBOutlet var Tv: UITableView!
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        
        let cell = sender.superview as! imageCell
    
        
        let refreshAlert = UIAlertController(title: "Delete", message: "All data will be lost.", preferredStyle: UIAlertController.Style.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            //swipe delete
            //self.Tv.delete(cell)
           print("Handle Ok logic here")
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
      
    }

// 앱 델리게이트 객체의 참조 정보를 읽어온다.
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let cellIdentifier: String = "cell"

//디바이스 스크린에 뷰 컨트롤러가 나타날 때마다 호출되는 메소드
override func viewWillAppear(_ animated: Bool) {
//테이블 데이터를 다시 읽어들인다. 이에 따라 행을 구성하는 로직이 다시 실행될 것이다.
self.tableView.reloadData()
}

// 테이블 뷰의 셀 개수를 결정하는 메소드
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
let count = self.appDelegate.imagelist.count
return count
}

//오류나는 지점 $$$$
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//imagelist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
let row = self.appDelegate.imagelist[indexPath.row]

//이미지 속성이 비어있을 경우 "imageCell" 아니면 "imageCellWithImage"
//let cellId = row.image == nil ? "imageCell" : "imageCellWithImage"


let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! imageCell

//imageCell의 내용을 구성한다.
cell.img?.image = row.image


//Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포멧에 맞게 변경한다.
let formatter = DateFormatter()
formatter.dateFormat = "yyyy-MM-dd"
cell.regdate?.text = formatter.string(from: row.regdate!)
    cell.weekLbl.text = row.contents //주차 입력

//cell객체를 리턴한다.
return cell
/* imagelist 배열 데이터에서 주어진 행에 맞는 데이터를 꺼낸다.
 let row = self.appDelegate.imagelist[indexPath.row]
 
 //이미지 속성이 비어있을 경우 "imageCell" 아니면 "imageCellWithImage"
 //let cellId = row.image == nil ? "imageCell" : "imageCellWithImage"
 
 
 let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! imageCell
 
 //imageCell의 내용을 구성한다.
 cell.img?.image = row.image
 
 
 //Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포멧에 맞게 변경한다.
 let formatter = DateFormatter()
 formatter.dateFormat = "yyyy-MM-dd"
 cell.regdate?.text = formatter.string(from: row.regdate!)
 
 //cell객체를 리턴한다.
 return cell */



    }
        
        
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return 300
}
}
