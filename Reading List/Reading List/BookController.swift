//
//  BookController.swift
//  Reading List
//
//  Created by Michael Flowers on 4/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class BookController {
    var books: [Book] = []
    
    //create a computed property
    var readingListURL: URL? {
        
    //1. get the users document directory
        let fileManger = FileManager.default
        guard let documentDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil } //have to return nil because we are inside of a computed property
        
    //2. create a filename string for the plist
        let fileName = documentDirectory.appendingPathComponent("books.plist")
        
    //3. return the url
        return fileName
    }
    
    func saveToPersistentStore(){
        let encoder = PropertyListEncoder()
        guard let url = readingListURL else { return }
        do {
            let bookData = try encoder.encode(books)
            try bookData.write(to: url )
        } catch  {
            print("Error savng books to p.store: \(error.localizedDescription)")
        }
    }
    
    func loadFromPersistentStore(){
        //because the url may or may not exist we can use the FM to see if it does exist
        let fm = FileManager.default
        guard let url = readingListURL, fm.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let bookDecoder = PropertyListDecoder()
            books = try bookDecoder.decode([Book].self, from: data)
        } catch  {
            print("Error loadng from the persistentStore: \(error.localizedDescription)")
        }
    }
}
