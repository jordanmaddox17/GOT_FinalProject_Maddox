
//
//  DetailViewController.swift
//  GOT_FinalProject_Maddox
//
//  Created by Jordan Maddox on 5/8/20.
//  Copyright © 2020 Jordan Maddox. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordsLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var regionImageView: UIImageView!
    @IBOutlet weak var coatOfArmsTextView: UITextView!
    @IBOutlet weak var coatOfArmsLabel: UILabel!
    
    var houseInfo: HouseInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if houseInfo == nil {
            houseInfo = HouseInfo(name: "", region: "", coatOfArms: "", words: "")
        }
        updateUserInterface()
    }

    func updateUserInterface() {
        nameLabel.text = houseInfo.name
        if wordsLabel.text != "" {
            wordsLabel.text = "\"\(houseInfo.words)\""
        }
        wordsLabel.text = houseInfo.words
        regionLabel.text = houseInfo.region
        regionImageView.image = UIImage(named: houseInfo.region)
        coatOfArmsTextView.text = houseInfo.coatOfArms
        if coatOfArmsTextView.text == "" {
            coatOfArmsLabel.isHidden = true
        }
    }
}
