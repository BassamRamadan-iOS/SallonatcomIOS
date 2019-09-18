//
//  profileCell.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/12/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
import SDWebImage
class profileCell: UIViewController {
    private var cellId = "profileCell"
    var infoOrders : infoo!
    @IBOutlet var userImage : UIImageView!
    @IBOutlet var userName : UILabel!
    @IBOutlet var userPhone : UILabel!
    @IBOutlet var tableView : UITableView!
    let dataName = [ "حجوزاتي" , "التنبيهات والإشعارات" , "تعديل بياناتي","الخروج"]
    let dataSubname = ["جدول مواعيد الحجوزات" , "تنبيهات لتأكيد الحجوزات","تعديل بيانات العضوية", "تسجيل الخروج"]
    let dataImage = [ "orders" , "edit" , "notifcation" , "logout"]

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fetchJSON(url: "https://salonatcom-app.com/mobile-app/api/user-profile/1")
    }
    fileprivate func setProfileData(){
        guard let name = self.infoOrders?.name , let phone = self.infoOrders?.phone , let image = self.infoOrders?.image else{
            return
        }
        userName.text = name
        userImage.sd_setImage(with: URL(string: image))
        userPhone.text = phone
    }
    fileprivate func fetchJSON(url : String){
        
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) {
            (data , response , error) in
            
            if let error = error {
                print("Failed1 " , error)
                return
            }
            guard let data = data else {return}
            
            do{
                let info = try
                    JSONDecoder().decode(profileInfo.self , from: data)
                self.infoOrders = info.data
              print(self.infoOrders!)
                DispatchQueue.main.async {
                    self.setProfileData()
                }
            }catch let error{
                print("Failed2 " , error)
                return
            }
            
            }.resume()
    }
    
   
}
extension profileCell :  UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if UIScreen.main.nativeBounds.width >= 1668.0{
            return 80
        }else{
            return 35
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        let label = UILabel()
        label.text = "إعدادات الحساب"
        label.textAlignment = .right
        
        if UIScreen.main.nativeBounds.width >= 1668.0{
            label.font = .boldSystemFont(ofSize: 28)
        }else{
            label.font = .boldSystemFont(ofSize: 20)
        }
        header.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -15).isActive = true
        label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 15).isActive = true
        label.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true
        return header
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CellForRow
        
        cell.uv.backgroundColor = .red
        cell.img.image = UIImage(named: dataImage[indexPath.row])
        cell.service.text = dataName[indexPath.row]
        cell.subtitleService.text = dataSubname[indexPath.row]
        
        if indexPath.row == 3 {
            cell.icon.isHidden = true
            cell.subtitleService.isHidden = true
            cell.uv.backgroundColor = .brown
        }
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 0{
            performSegue(withIdentifier: "myOrders", sender: self)
        }else if indexPath.row == 1{
            performSegue(withIdentifier: "notification", sender: self)
        }
    }

}
