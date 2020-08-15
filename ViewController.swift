//
//  ViewController.swift
//  feedAppDemo
//
//  Created by Mac on 22/09/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var posts : [Post] = []
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        let post = posts[indexPath.row]
        
        let stringurl = URL(string: "https://source.unsplash.com/random/" + String(indexPath.row))
        
        cell.bigImage.sd_internalSetImage(with: stringurl, placeholderImage: UIImage(named: "profile pic.png"), options: SDWebImageOptions.highPriority, context: nil, setImageBlock: nil, progress: nil, completed: nil)
        
        cell.profilePic.sd_internalSetImage(with: stringurl, placeholderImage: UIImage(named: "profile pic.png"), options: SDWebImageOptions.highPriority, context: nil, setImageBlock: nil, progress: nil, completed: nil)
        
        
        cell.profilePic.layer.cornerRadius = cell.profilePic.frame.height / 2
        cell.profilePic.clipsToBounds = true
        
        
        cell.titlename?.text = "loading"
        cell.subTitlename?.text = "loading"
        
        let id = post.userId ?? 1
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/" + String(id))
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            guard let datainfo = data else{
                return
            }
            do{
                let fessdata = try JSONDecoder().decode(User.self, from: datainfo)
               
                DispatchQueue.main.async {
                    cell.titlename?.text = fessdata.name
                    cell.subTitlename?.text = fessdata.username

                }
                
            }catch {
                print(error.localizedDescription)
            }
            
            }.resume()
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchPost()
    }
    
    func fetchPost(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        URLSession.shared.dataTask(with: url!){(data,response,error) in
            guard let datainfo = data else{
                return
            }
            do{
                let fessdata = try JSONDecoder().decode([Post].self, from: datainfo)
                self.posts = fessdata
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
//    func updateuser(id: Int){
//        
//    }



}

