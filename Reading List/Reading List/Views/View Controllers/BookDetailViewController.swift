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
    var book: Book? {
        didSet {
            updateViews()
        }
    }

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var reasonTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func saveBook(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, !title.isEmpty, let reason = reasonTextView.text, !reason.isEmpty else { return }
        if book == nil {
            bc?.createBook(with: title, andReason: reason)
        } else if let passedInBook = book{
            bc?.update(book: passedInBook, with: title, and: reason)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    private func updateViews(){
        if let passedInBook = book, isViewLoaded {
            title = passedInBook.title
            titleTextField.text = passedInBook.title
            reasonTextView.text = passedInBook.reasonToRead
        } else {
            title = "Add a new book"
        }
    }

}
