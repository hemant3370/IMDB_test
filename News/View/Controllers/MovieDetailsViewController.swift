//
//  MovieDetailsViewController.swift
//  IMDB
//
//  Created by Hemant Singh on 28/05/22.
//

import UIKit

final class MovieDetailsViewController: UITableViewController {

    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = movie.title
        tableView.register(UINib(nibName: "MovieDetailsCell", bundle: nil), forCellReuseIdentifier: "MovieDetailsCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailsCell", for: indexPath) as? MovieDetailsCell {
            cell.configureFor(movie: movie)
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
}
