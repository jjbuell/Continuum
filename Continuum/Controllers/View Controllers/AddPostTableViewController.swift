//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by JJB on 5/11/21.
//  Copyright © 2021 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    
    //MARK: - Outlets
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectImageButton.setTitle("Select Image", for: .normal)
        
        photoImageView.image = nil
        captionTextField.text = ""
    }
    
    
    //MARK: - Properties
    
    
    
    //MARK: - Actions
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        photoImageView.image = #imageLiteral(resourceName: "spaceEmptyState")
        selectImageButton.setTitle(nil, for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        if let photo = photoImageView.image,
           let caption = captionTextField.text {
            
            PostController.shared.createPostWith(image: photo, caption: caption) { (_) in
                //TODO: later in the project
            }
            //send the user back to the PostListTableViewController
            self.tabBarController?.selectedIndex = 0
        } else {
            presentSimpleAlertWith(title: "Sorry", message: "You must select photo and add caption to Post!")
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
} //End of class


//MARK: - Extension
extension AddPostTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
    }
}

