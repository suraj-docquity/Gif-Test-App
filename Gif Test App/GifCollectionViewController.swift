//
//  GifCollectionViewController.swift
//  Gif Test App
//
//  Created by Suraj Jaiswal on 13/02/23.
//

import UIKit
import SDWebImage

class GifCollectionViewController: UIViewController {
    
    
    @IBOutlet var gifCollectionView: UICollectionView!
    
    var dogData : DogData?
    var dogImgLinks = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData(){
        let url = URL(string: "https://dog.ceo/api/breed/hound/images")
        let task = URLSession.shared.dataTask(with: url!, completionHandler:{
            (data,response,error) in
            
            guard let data = data, error == nil else {
                print("Error while accessing data")
                return
            }
            
            var dogObject : DogData?
            do{
                dogObject = try JSONDecoder().decode(DogData.self, from: data)
            }
            catch{
                print("Error while data parsing")
            }
            self.dogData = dogObject
            self.dogImgLinks = self.dogData!.message
            
            DispatchQueue.main.async {
                self.gifCollectionView.reloadData()
            }
        })
        
        task.resume()
    }
}


extension GifCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dogImgLinks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = gifCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GifCollectionViewCell
        
        if let imgURL = URL(string: dogImgLinks[indexPath.row]){
            cell.gifImgView.sd_imageIndicator = SDWebImageActivityIndicator.white
            cell.gifImgView.sd_imageIndicator?.startAnimatingIndicator()
            cell.gifImgView.sd_setImage(with: imgURL, placeholderImage: UIImage(named: "empty-img.png"), options: .continueInBackground,completed: nil)
            cell.gifImgView.contentMode = .scaleToFill
            cell.gifImgView.layer.cornerRadius = cell.gifImgView.frame.height / 2
            
        }else{
            print("No images found")
            cell.gifImgView.image = UIImage(named: "empty-img.png")
        }
        
        return cell
    }
    
    
}
