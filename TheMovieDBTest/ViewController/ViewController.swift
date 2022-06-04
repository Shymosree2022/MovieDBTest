//
//  ViewController.swift
//  TheMovieDBTest
//
//  Created by Shymosree on 4/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var movieListView: UITableView!
    @IBOutlet weak var movieSearch: UISearchBar!
    var viewModel = TheMovieDBViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.movieSearch.delegate = self
        self.movieListView.delegate = self
        self.movieListView.dataSource = self
        movieListView.register(UINib(nibName: "MovieListCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListCellTableViewCell")
//        movieListView.estimatedRowHeight = 44.0
//        movieListView.rowHeight = UITableView.automaticDimension
        self.viewModel.fetchConfigData()
        bindViewModel()
        
        // Do any additional setup after loading the view.
    }

    
    func bindViewModel() {
        viewModel.movieListBinding = { [weak self] (_, success) in
            DispatchQueue.main.async {
                self?.movieListView.reloadData()
               // self?.collectionView?.reloadData()
            }
        }
    }
    

}


extension ViewController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
        if searchBar.text?.isEmpty == false {
            if let searchText = searchBar.text {
                self.viewModel.fetchData(param: searchText)
            }

        }
        
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            //
//        return 0
//        }
//
//    
//    
//
//        
//    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCellTableViewCell")!
//            return cell
//        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.viewModel.movieList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCellTableViewCell", for: indexPath) as! MovieListCellTableViewCell
        let title = self.viewModel.movieList[indexPath.row].originalTitle
        let overview = self.viewModel.movieList[indexPath.row].overview
        if let configUrl = self.viewModel.configurationUrl, let posterSize = self.viewModel.configurationPosterSize {
            let imageUrl = configUrl.appending(posterSize).appending(self.viewModel.movieList[indexPath.row].posterPath)
            cell.setData(title: title, overview: overview, url: imageUrl)
        }
        // Configure the cell...
        return cell
    }

    func tableView(_ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    // MARK: - Table view delegate
}

