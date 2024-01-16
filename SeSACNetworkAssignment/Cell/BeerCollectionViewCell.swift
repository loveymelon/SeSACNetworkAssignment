//
//  BeerCollectionViewCell.swift
//  SeSACNetworkAssignment
//
//  Created by 김진수 on 1/16/24.
//

import UIKit
import Kingfisher

class BeerCollectionViewCell: UICollectionViewCell {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var beerImageLabel: UILabel!
    @IBOutlet var beerDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainLabel.text = "오늘은 이 맥주를 추천합니다."
        self.mainLabel.textAlignment = .center
        self.mainLabel.font = .boldSystemFont(ofSize: 12)
        self.beerImageLabel.textAlignment = .center
        
        self.beerDetailLabel.font = .systemFont(ofSize: 12)
        self.beerDetailLabel.numberOfLines = 0
    }
    
    func configureCell(data: Beer) {
        self.mainImageView.kf.setImage(with: URL(string: data.image_url))
        self.beerImageLabel.text = data.name
        self.beerDetailLabel.text = data.description
    }

}
