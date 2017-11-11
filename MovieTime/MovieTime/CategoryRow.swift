//
//  CategoryRow.swift
//  MovieTime
//
//  Created by Jon Halverson on 11/10/17.
//  Copyright © 2017 Team 4. All rights reserved.
//

import UIKit
import TMDBSwift

class CategoryRow : UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var genre:Genre? = nil {
        didSet {
            collectionView.reloadData()
        }
    }
}

extension CategoryRow : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genre!.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath as IndexPath) as! posterCell
        
        let movie: MovieMDB
        movie = (genre?.movies[indexPath.row])!
        
        if !(movie.poster_path == nil){
            let posterPath = "\(movie.poster_path!)"
            if let imageURL = URL(string:"\(TMDBBase.imageURL)\(posterPath)"){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imgView.image = image
                        }
                    }
                }
            }
        } else {
            cell.imgView.image = UIImage(named: "image_not_available")
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = genre?.movies[indexPath.row]{
            clickedMovie = movie
        }
    }
    
}
