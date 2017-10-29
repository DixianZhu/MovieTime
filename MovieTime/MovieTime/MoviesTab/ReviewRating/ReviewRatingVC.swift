//
//  RatingViewController.swift
//  PopupDialog
//
//  Created by Martin Wildfeuer on 11.07.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Material
import HCSStarRatingView

class ReviewRatingVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var alertLabel: UILabel!
    @IBOutlet weak var starRating: HCSStarRatingView!
    @IBOutlet weak var reviewTextView: TextView!
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textView: UITextView) -> Bool {
        endEditing()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reviewTextView.delegate = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
