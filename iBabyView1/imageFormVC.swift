//
//  imageFormVC.swift
//  iBabyView1
//
//  Created by SSO on 10/11/2018.
//  Copyright © 2018 sso. All rights reserved.
//

import UIKit

class imageFormVC: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var subject: String! // 제목을 저장하는 역할 - 여기선 필요없는거 같음.

    @IBOutlet var weekLbl: UILabel!
    @IBAction func stepper(_ sender: UIStepper) {
        
        weekLbl.text = Int(sender.value).description
    }
    @IBOutlet var preview: UIImageView!
    
    @IBAction func pick(_ sender: Any) {
        
        //이미지 피커 인스턴스를 생성함.
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        
        //이미지 피커 화면을 표시함.ture는 편집기능 사용, false는 편집기능 사용안함.
        self.present(picker, animated: false)
        
       
        
    }
    
    //이미지 선택을 완료했을때 호출되는 메서드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.preview.image = originalImage
        }
        //guard (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) != nil else { return }

        
        //선택된 이미지를 미리보기에 표기함.
        self.preview.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
      
        
        //이미지 피커 컨트롤러 닫기
        picker.dismiss(animated: false)
    }

    @IBAction func save(_ sender: Any) {
       
        /* ① 내용을 입력하지 않았을 경우, 경고한다.
        guard self.preview.image!.isAmpty == false else { //?를 ! 로 바꿔보셈
            let alert = UIAlertController(title: nil,
                                          message: "내용을 입력해주세요",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }*/
        
        //imageData 객체를 생성하고, 데이터를 담는다.
        let data = imageData()
        
        data.title = self.subject //제목
        //data.contents = self.contents.text //내용
        data.image = self.preview.image //이미지
        data.regdate = Date() // 작성 시간
        
        data.contents = weekLbl.text // 주차 입력
        
        //앱 델리게이트 객체를 읽어온 다음, memolist 배열에 memoData 객체를 추가한다.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.imagelist.append(data)
        
        //작성폼 화면을 종료하고, 이전화면으로 되돌아간다.
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
