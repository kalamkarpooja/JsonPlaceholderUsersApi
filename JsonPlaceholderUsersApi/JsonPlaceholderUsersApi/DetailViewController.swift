//
//  DetailViewController.swift
//  JsonPlaceholderUsersApi
//
//  Created by Mac on 03/04/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var website: UILabel!
    @IBOutlet weak var company: UILabel!
    var user : UserData?
    override func viewDidLoad() {
        super.viewDidLoad()

        name.text = String(user!.name)
        email.text = "Email : \(user!.email)"
        phone.text = "PhoneNo : \(user!.phone)"
        website.text = "Website : \(user!.website)"
        address.text = "Address :\(user!.address)"
        company.text = "Company : \(user!.company)"
    }

}
