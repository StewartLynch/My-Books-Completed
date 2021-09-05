//
//  ViewController.swift
//  My Books
//
//  Created by Stewart Lynch on 2021-09-03.
//  Copyright © 2021 Stewart Lynch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var books:[Book] = []
    var selectedBook: Book?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        books = Book.sampleBooks.sorted {$0.name < $1.name}
    }
    
    @IBAction func addBook(_ sender: Any) {
        selectedBook = nil
        performSegue(withIdentifier: "updateBookSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "updateBookSegue" {
            let vc = segue.destination as! EditViewController
            vc.delegate = self
            vc.thisBook = selectedBook
        }
    }
}

extension ViewController: EditViewControllerDelegate {
    func newUpdate(book: Book, new:Bool = false) {
        if new {
            books.append(book)
            books = books.sorted {$0.name < $1.name}
        } else {
            let index = books.firstIndex{$0.id == book.id}
            if let index = index {
                books[index].name = book.name
                books[index].author = book.author
                books[index].genre = book.genre
                books[index].rating = book.rating
            }
            books = books.sorted {$0.name < $1.name}
        }
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BooksTableViewCell
        let book = books[indexPath.row]
        cell.configureCell(for: book)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBook = books[indexPath.row]
        performSegue(withIdentifier: "updateBookSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
