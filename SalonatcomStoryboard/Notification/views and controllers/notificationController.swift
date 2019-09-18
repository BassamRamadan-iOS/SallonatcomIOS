//
//  notificationController.swift
//  SalonatcomStoryboard
//
//  Created by Bassam Ramadan on 9/13/19.
//  Copyright © 2019 Bassam Ramadan. All rights reserved.
//

import UIKit
import SDWebImage
class notificationController: UIViewController {
    private var cellId = "notification"
    var infoOrders = [holdOrders]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      fetchJSON(url: "https://salonatcom-app.com/mobile-app/api/user-orders")
    }
    @IBOutlet var tableView : UITableView!
    fileprivate func fetchJSON(url : String){
        self.infoOrders.removeAll()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
                    JSONDecoder().decode(MyOrdersdata.self , from: data)
                self.infoOrders = info.data
                
                OperationQueue.main.addOperation {
                    self.tableView.reloadData()
                }
            }catch let error{
                print("Failed2 " , error)
                return
            }
            
            }.resume()
    }
}
extension notificationController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoOrders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ViewsCell
        cell.nameSallon.text = infoOrders[indexPath.row].saloon_info.name
        cell.statusOrder.text = transformStatus(status: infoOrders[indexPath.row].status)
        cell.dateOrder.text = infoOrders[indexPath.row].reservation_date
        cell.icon.backgroundColor = transformColor(status: infoOrders[indexPath.row].status)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    fileprivate func transformStatus(status : String) -> String{
        switch status {
        case "pending":
            return "قيد المعاينة"
        case "confirmed":
            return "تم تأكيد الحجز"
        case "rejected":
            return "تم رفض الحجز"
        default:
            return String()
        }
    }
    fileprivate func transformColor(status : String) -> UIColor{
        switch status {
        case "pending":
            return .yellow
        case "confirmed":
            return .green
        case "rejected":
            return .red
        default:
            return UIColor()
        }
    }
}
