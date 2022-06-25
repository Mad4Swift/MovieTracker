//
//  MovieApiUrlSession.swift
//  myMovieTrackerApp
//
//  Created by Atakan Gedik on 23.06.2022.
//

import UIKit

final class movieListAPI {
    
    static let shared = movieListAPI()

    func fetchMovieList(onCompletion: @escaping ([Result]) -> ()) {
    let movieUrlString = "https://api.themoviedb.org/3/movie/popular?api_key=a3f6ee450ae2e76394cb2ab1e46d4675&language=en-US&page=1"
    let movieUrl = URL(string: movieUrlString)!
    
    let task = URLSession.shared.dataTask(with: movieUrl)  { (jsonData, resp, error) in
        
        guard let jsonData = jsonData else {
            print("Movie List was nill")
            return
        }
        
        guard let movieList = try? JSONDecoder().decode(Welcome.self, from: jsonData) else {
            print("Json file could not be decoded")
            return
        }
        
        onCompletion(movieList.results ?? [])
    }
        task.resume()
}
    
}
