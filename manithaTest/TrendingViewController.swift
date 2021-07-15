//
//  TrendingViewController.swift
//  manithaTest
//
//  Created by Arvind Kant on 15/07/21.
//

import UIKit
import Kingfisher

struct jsonstruct:Decodable {
    let name:String
    let author: String
    let description:String
    let avatar: String
    let language:String
    let stars:Int
    let forks:Int
    let url: String
}

class TrendingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableview: UITableView!
    var refreshControl: UIRefreshControl!

    var arrdata = [jsonstruct]()
    override func viewDidLoad() {
        super.viewDidLoad()
       getdata()
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
      
        tableview.addSubview(refreshControl)

        
    }

    func getdata(){
        let url = URL(string: "https://run.mocky.io/v3/f5d617d3-046b-4e25-84f3-6db123dfcb68")
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            do{if error == nil{

                self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)

                for mainarr in self.arrdata{
//                    print(mainarr.name,":",mainarr.username,":",mainarr.phone)
                    print(mainarr.language)

                    DispatchQueue.main.async {
                         self.tableview.reloadData()
                    }
        
                }
            }
            }catch{
                print("Error in get json data", error)
            }
            
        }.resume()
    }
    
    
    //TableView
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160.0;
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrdata.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.lblname.text = arrdata[indexPath.row].name
        cell.lblAuthor.text = arrdata[indexPath.row].author
        cell.lbldescription.text = "\(arrdata[indexPath.row].description)" + " ( " +  "\(arrdata[indexPath.row].url)" + " ) "
        let url = URL(string:  arrdata[indexPath.row].avatar)
        cell.avatarImg?.kf.setImage(with: url)
        cell.lbllang?.text = arrdata[indexPath.row].language
        cell.lblstars?.text = "\(arrdata[indexPath.row].stars)"
        cell.lblfork?.text = "\(arrdata[indexPath.row].forks)"
//        detail.strname = "Name :\(arrdata[indexPath.row].name)"

        return cell
    }
    
    @IBAction func rightBarButtonAction(_ sender: Any) {
        print("right bar button action")
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")

        self.navigationController?.pushViewController(vc,animated:true)
    }
    
    @objc func refresh(_ sender: Any) {
        //  your code to reload tableView
        tableview.reloadData()
        refreshControl.endRefreshing()

    }


      
      }

extension UIImageView {

 public func imageFromServerURL(urlString: String, PlaceHolderImage:UIImage) {

        if self.image == nil{
              self.image = PlaceHolderImage
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })

        }).resume()
    }}




