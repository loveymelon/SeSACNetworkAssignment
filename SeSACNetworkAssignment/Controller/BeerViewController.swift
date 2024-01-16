//
//  BeerViewController.swift
//  SeSACNetworkAssignment
//
//  Created by 김진수 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var beerLabel: UILabel!
    @IBOutlet var beerDetailTextView: UITextView!
    @IBOutlet var recommendButton: UIButton!
    
    let manager = BeerAPIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designUI()
    }

    @IBAction func tappedRecommendButton(_ sender: UIButton) {
        designUI()
    }
}

extension BeerViewController {
    func designUI() {
        manager.callResponse { result in
            self.mainImageView.kf.setImage(with: URL(string: result[0].image_url))
            self.beerLabel.text = result[0].name
            self.beerDetailTextView.text = result[0].description
        }
    }
    func designButton() {
        self.recommendButton.setTitle("다른 맥주 추천받기", for: .normal)
        self.recommendButton.setTitleColor(.orange, for: .normal)
    }
}
