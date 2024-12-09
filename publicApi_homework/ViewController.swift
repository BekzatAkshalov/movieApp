//
//  ViewController.swift
//  publicApi_homework
//
//  Created by Bekzat on 2/12/24.
//

import UIKit
import SVProgressHUD
class ViewController: UIViewController {

    
    
    @IBOutlet weak var posterFull: UIImageView!
    
    
    var poster = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let posterBaseURL = "https://image.tmdb.org/t/p/w500"
        posterFull.sd_setImage(with: URL(string: "\(posterBaseURL)\(poster)"))
       
    }
    


}

