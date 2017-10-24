//
//  MovieDetailsVC.swift
//  MovieTime
//
//  Created by Jon Halverson on 10/24/17.
//  Copyright © 2017 Team 4. All rights reserved.
//

import UIKit

class MovieDetailsVC: UIViewController {

    @IBOutlet weak var posterImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    var clickedMovieId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("clicked movie ID: \(self.clickedMovieId)")
    }

}
