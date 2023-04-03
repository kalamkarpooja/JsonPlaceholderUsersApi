//
//  ViewController.swift
//  JsonPlaceholderUsersApi
//
//  Created by Mac on 01/04/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userCollectionView: UICollectionView!
    var usersData = [UserData]()
    override func viewDidLoad() {
        super.viewDidLoad()
       jsonSeriallization()
        cellRegister()
    }
    func cellRegister(){
        let uinib = UINib(nibName: "UserCollectionViewCell", bundle: nil)
        userCollectionView.register(uinib, forCellWithReuseIdentifier: "UserCollectionViewCell")
    }
    func jsonSeriallization(){
        let urlstring = "https://jsonplaceholder.typicode.com/users"
        let url = URL(string: urlstring)
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "GET"
        URLSession.shared.dataTask(with: urlRequest) {data,response,error in
            print(String(data: data!, encoding: .utf8)!)
            print(response)
            
            let jsonDecoder = JSONDecoder()
            let userResponse = try! jsonDecoder.decode([UserData].self, from: data!)
            self.usersData = userResponse
                DispatchQueue.main.async {
                    self.userCollectionView.reloadData()
                }
        }.resume()
        }

    }


extension ViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        usersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = userCollectionView.dequeueReusableCell(withReuseIdentifier:
            "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell
        
        let user = usersData[indexPath.row]
        cell.idLabel.text = "Id :\( user.id)"
        cell.nameLabel.text =  user.name
        cell.emailLabel.text = "Email : \(user.email)"
        cell.websiteLabel.text = "Website : \(user.website)"
        cell.layer.borderWidth = 6
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = .init(genericCMYKCyan: 2, magenta: 2, yellow: 1, black: 3, alpha: 2)
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 220, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.user = usersData[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
