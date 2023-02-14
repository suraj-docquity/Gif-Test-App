//
//  ViewController.swift
//  Gif Test App
//
//  Created by Suraj Jaiswal on 13/02/23.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet var gifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        gifView.sd_setImage(with: URL(string: "https://media0.giphy.com/media/zaYShNqUNz1BAjBsvX/giphy_s.gif?cid=3befa875agozlaydelfeano6rrlcsuk76enhnaqkoreyvs4k&rid=giphy_s.gif&ct=g") , placeholderImage:UIImage(named: "empty-img.png"))
        
        gifView.sd_setImage(with: URL(string: "https://media1.giphy.com/media/26gsezXAOSandJyyQ/giphy.gif?cid=3befa8750d8a69c161c80a43bf8e3e010a46c89688c173ef&rid=giphy.gif&ct=g") , placeholderImage:UIImage(named: "empty-img.png"))
    }

}

