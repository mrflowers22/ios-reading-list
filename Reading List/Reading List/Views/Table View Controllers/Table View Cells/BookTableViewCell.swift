//
//  BookTableViewCell.swift
//  Reading List
//
//  Created by Michael Flowers on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    
    weak var delegate: BookTableViewCellDelegate?
    var book: Book? {
        didSet {
            updateViews()
            print(book?.title)
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkButtonProperties: UIButton!
  
    @IBAction func checkMarkButtonPressed(_ sender: UIButton) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    private func updateViews(){
        guard let passedInBook = book else { return }
        titleLabel.text = passedInBook.title
        
//        guard let buttonImage = passedInBook.hasBeenRead ? UIImage(named: "checked") : UIImage(named: "unchecked") else { return }
        guard let buttonImage = passedInBook.hasBeenRead ? "checked" : "unchecked" else { return }
        checkButtonProperties.imageView?.image = UIImage(named: buttonImage)
        print("\(buttonImage)")
    }
    
}
