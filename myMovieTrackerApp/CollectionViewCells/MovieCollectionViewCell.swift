//
//  MovieCollectionViewCell.swift
//  myMovieTrackerApp
//
//  Created by Atakan Gedik on 23.06.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    let backView = UIView()
    let movieImage = UIImageView()
    let movieReleaseDate = UILabel()
    let movieRating = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionViewCustomCell()
        setupMovieRating()
        setupBackView()
        setupMovieReleaseDate()
        setupMovieImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCollectionViewCustomCell(){
        contentView.backgroundColor = UIColor.clear
    }
    
    func setupMovieRating(){
        addSubview(movieRating)
        movieRating.text = "Rating: 9.9"
        movieRating.backgroundColor = UIColor.clear
        movieRating.textColor = .systemYellow
        movieRating.font = .systemFont(ofSize: 16)
        movieRating.textAlignment = .center
        
        movieRating.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieRating.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            movieRating.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            movieRating.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            movieRating.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupBackView(){
        addSubview(backView)
        backView.backgroundColor = UIColor(red: 0.11, green: 0.14, blue: 0.19, alpha: 1)
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 10
        backView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: movieRating.bottomAnchor,constant: 2),
            backView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -10),
            backView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 10),
            backView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -10)
        ])
    }
    
    func setupMovieReleaseDate(){
        backView.addSubview(movieReleaseDate)
        movieReleaseDate.text = "26.04.1995"
        movieReleaseDate.backgroundColor = UIColor.clear
        movieReleaseDate.font = .systemFont(ofSize: 16)
        movieReleaseDate.textColor = UIColor(red: 0.98, green: 0.95, blue: 0.89, alpha: 1)
        movieReleaseDate.textAlignment = .center
        movieReleaseDate.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieReleaseDate.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            movieReleaseDate.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            movieReleaseDate.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            movieReleaseDate.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupMovieImage(){
        backView.addSubview(movieImage)
        movieImage.image = UIImage()
        movieImage.clipsToBounds = true
        movieImage.contentMode = .scaleAspectFit
        movieImage.backgroundColor = UIColor.clear
        movieImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: movieRating.bottomAnchor,constant: 5),
            movieImage.bottomAnchor.constraint(equalTo: movieReleaseDate.topAnchor,constant: -5),
            movieImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            movieImage.centerXAnchor.constraint(equalTo: backView.centerXAnchor)
        ])
    }
    

    
}
