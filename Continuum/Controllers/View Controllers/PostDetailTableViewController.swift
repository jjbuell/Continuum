//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by JJB on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

   
    //MARK: - Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK: - Properties
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Actions
    @IBAction func commentButtonTapped(_ sender: Any) {
    presentAddCommentAlert(for: nil)
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
        //TODO: later in project
    }
    @IBAction func followPostButtonTapped(_ sender: Any) {
        //TODO: later in project
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        
        let comment = post?.comments[indexPath.row]
        
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = comment?.timestamp.formatDate()

        return cell
    }
 

    //MARK: - Helper Functions
    func updateViews() {
        photoImageView.image = post?.photo
        tableView.reloadData()
    }
    
    func presentAddCommentAlert(for post: Post?) {
        let alert = UIAlertController(title: "Comment", message: "Write a comment", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Enter comment here..."
            textField.autocorrectionType = .yes
            textField.autocapitalizationType = .sentences
            textField.delegate = self
            
            }
        
        let saveAction = UIAlertAction(title: "OK", style: .default) { (_) in
            guard let commentText = alert.textFields?.first?.text, !commentText.isEmpty else {return}
            
            if let post = self.post {
                PostController.shared.addComment(text: commentText, post: post) { (_) in
                    //TODO
                }
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    } //End of presentAddCommentAlert function
} //End of class


//MARK: - Extension
extension PostDetailTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
