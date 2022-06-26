//
//  MovieTrackerDetailView.swift
//  myMovieTrackerApp
//
//  Created by Atakan Gedik on 25.06.2022.
//

import UIKit

class MovieDetailVievCell: UITableViewCell {
    
    let container: UIView = {
        let temp = UIView()
        temp.backgroundColor = .black
        temp.clipsToBounds = true
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let backDropImage: UIImageView = {
        let temp = UIImageView()
        temp.backgroundColor = UIColor.clear
        temp.clipsToBounds = true
        temp.contentMode = .scaleAspectFill
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let movieTitle: UILabel = {
        let temp = UILabel()
        temp.backgroundColor = UIColor.clear
        temp.textColor = .yellow
        temp.clipsToBounds = true
        temp.textAlignment = .center
        temp.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        temp.text  = "No Data"
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    let movieInfo: UILabel = {
        let temp = UILabel()
        temp.backgroundColor = UIColor.clear
        temp.textColor = .white
        temp.clipsToBounds = true
        temp.textAlignment = .natural
        temp.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        temp.text = "No Data"
        temp.numberOfLines = 0
        temp.sizeToFit()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupImage()
        setupTitle()
        setupInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(container)
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupImage(){
        container.addSubview(backDropImage)
        NSLayoutConstraint.activate([
            backDropImage.topAnchor.constraint(equalTo: container.topAnchor),
            backDropImage.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            backDropImage.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            backDropImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupTitle(){
        container.addSubview(movieTitle)
        NSLayoutConstraint.activate([
            movieTitle.topAnchor.constraint(equalTo: backDropImage.bottomAnchor,constant: 5),
            movieTitle.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            movieTitle.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            movieTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func setupInfo(){
        container.addSubview(movieInfo)
        NSLayoutConstraint.activate([
            movieInfo.topAnchor.constraint(equalTo: movieTitle.bottomAnchor,constant: 10),
            movieInfo.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            movieInfo.trailingAnchor.constraint(equalTo: container.trailingAnchor)
        ])
    }

}
