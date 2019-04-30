//
//  BookDetailViewController.swift
//  Reading List
//
//  Created by Michael Flowers on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    var bc: BookController?
    var book: Book?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reasonTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveBook(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty, let reason = reasonTextView.text, !reason.isEmpty else { return }
        if book == nil {
            bc?.createBook(with: title, andReason: reason)
        } else {
            bc.
        }
    }
    
    private func updateViews(){
        if let passedInBook = book {
            title = passedInBook.title
            titleTextField.text = passedInBook.title
            reasonTextView.text = passedInBook.reasonToRead
        } else {
            title = "Add a new book"
        }
    }

}
