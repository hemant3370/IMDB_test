//
//  ViewController.swift
//  IMDB
//
//  Created by Hemant Singh on 28/05/22.
//

import UIKit

final class ViewController: UITableViewController {
    
    private var movies = [Movie]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "MovieGistCell", bundle: nil), forCellReuseIdentifier: "MovieGistCell")
        getMovies()
    }

    private func getMovies() {
        NetworkManager.shared.getArticles { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movies):
                    self?.movies = movies
                case.failure(let error):
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    self?.present(alert, animated: true)
                }
            }
        }
    }

}

extension ViewController {
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieGistCell")
        if let cell = cell as? MovieGistCell {
            cell.configureFor(movie: movies[indexPath.row])
        }
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let detailsVC = MovieDetailsViewController(movie: movie)
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
