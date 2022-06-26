//
//  MovieTrackerRootVC.swift
//  myMovieTrackerApp
//
//  Created by Atakan Gedik on 23.06.2022.
//

import UIKit
import Kingfisher

class MovieTrackerRootVC: UIViewController {
    
    var movieCollectionView:UICollectionView?
    var movieBaseList:[Result] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieListAPI.shared.fetchMovieList { [weak self] result in
            self?.reloadData(data: result)
        }
        setupVC()
        setupMovieCollectionView()
    }
    
    func reloadData(data: [Result]) {
        self.movieBaseList = data
        DispatchQueue.main.async {
            self.movieCollectionView?.reloadData()
        }
    }
    
    func setupVC(){
        title = "Movie Tracker"
        view.backgroundColor = .red
    }
    
    func setupMovieCollectionView(){
        let mainLayout = UICollectionViewFlowLayout()
        mainLayout.scrollDirection = .vertical
        mainLayout.itemSize = CGSize(width: 200, height: 220)
        movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout:  mainLayout)
        guard let movieCollectionView = movieCollectionView else {return}
        view.addSubview(movieCollectionView)
        movieCollectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.backgroundColor = .black
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    


}

extension MovieTrackerRootVC: UICollectionViewDelegate,UICollectionViewDataSource {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movieBaseList.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = movieCollectionView?.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath)
    
    guard let cell = cell as? MovieCollectionViewCell else {
        return UICollectionViewCell()
    }
    
    cell.movieReleaseDate.text = movieBaseList[indexPath.row].releaseDate
    let movieRating:String = movieBaseList[indexPath.row].voteAverage?.string ?? ""
    cell.movieRating.text = "Rating: \(movieRating)"
    let posterImageUrl = URL(string: movieBaseList[indexPath.row].posterUrlString)
    cell.movieImage.kf.setImage(with: posterImageUrl)
    
    return cell
}

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
        let movieDetailVC = MovieTrackerDetailVC()
        movieDetailVC.movie = movieBaseList[indexPath.row]
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}
