//
//  MovieDetailViewModel.swift
//  tembici-challenge
//
//  Created by Hannah  on 14/05/2020.
//  Copyright © 2020 Hannah . All rights reserved.
//

import Foundation

class MovieDetailViewModel: ObservableObject  {
   
    @Published var urlImage = String()
    @Published var title = String()
    @Published var overview = String()
    @Published var date = String()
    @Published var genresList = [String]()
    @Published var movie: Movie
    
    var globalState: GlobalState

    init(movie: Movie, globalState: GlobalState) {
        self.movie = movie
        self.globalState = globalState
        self.setUrlImage()
        self.setTitle()
        self.setDate()
        self.setOverview()
        self.setGenresList()
      }
    
    fileprivate func setTitle() {
        self.title = self.movie.title
    }
    fileprivate func setOverview() {
          self.overview = self.movie.overview
      }
    fileprivate func setDate() {
        self.date = FormatterDate.getCompleteDate(dateString: movie.releaseDate)
    }
    fileprivate func setUrlImage() {
           if let poster = self.movie.backdropPath {
               self.urlImage = poster
           }
    }
    fileprivate func setGenresList() {
        self.genresList =  (globalState.genres.filter {movie.genreIDS.contains ($0.id)}).map { $0.name }
        print ("LIST---", self.globalState.genres)

        print ("LIST---", self.genresList)
    }
       
}

