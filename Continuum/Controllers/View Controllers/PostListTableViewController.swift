//
//  PostListTableViewController.swift
//  Continuum
//
//  Created by JJB on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    
    //MARK: - Outlets
    @IBOutlet weak var captionSearchBar: UISearchBar!
    
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        resultsArray = PostController.shared.posts
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionSearchBar.delegate = self
    }
    
    
    //MARK: - Properties
    var resultsArray: [Post] = []
    var isSearching: Bool = false
    var dataSource: [SearchableRecord] {
        get {
            isSearching ? resultsArray : PostController.shared.posts
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
        
        let post = dataSource[indexPath.row] as? Post
        cell.post = post

        return cell
    }
   

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? PostDetailTableViewController else {return}
            
            let post = dataSource[indexPath.row] as? Post
            destinationVC.post = post
        }
    }
} //End of class


//MARK: - Extension
extension PostListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            // search for captions?
            resultsArray = PostController.shared.posts.filter { $0.matchesSearchTerm(searchTerm: searchText) }
        } else {
            resultsArray = PostController.shared.posts
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        captionSearchBar.text = ""
        resultsArray = PostController.shared.posts
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
} //End of extension


