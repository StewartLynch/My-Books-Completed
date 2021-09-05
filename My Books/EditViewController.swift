//
//  EditViewController.swift
//  My Books
//
//  Created by Stewart Lynch on 2021-09-03.
//  Copyright © 2021 Stewart Lynch. All rights reserved.
//

import UIKit
import SwiftUI

protocol EditViewControllerDelegate {
    func newUpdate(book: Book, new:Bool)
}

class EditViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var author: UITextField!
    @IBOutlet weak var genre: UIPickerView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var genrePickerView: UIPickerView!
    @IBOutlet weak var editButton: UIButton!
    
    var delegate: EditViewControllerDelegate?
    var thisBook:Book?
    let pickerData = Book.Genre.pickerArray
    var newRating = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genrePickerView.delegate = self
        genrePickerView.dataSource = self
        author.delegate = self
        name.delegate = self
        setupView()
    }
 
    @IBAction func textChanged(_ sender: UITextField) {
          updateDisability()
    }
    
    func setupView() {
        name.delegate = self
        author.delegate = self
        name.text = thisBook?.name ?? ""
        author.text = thisBook?.author ?? ""
        bgView.layer.shadowColor = UIColor.black.cgColor
        bgView.layer.cornerRadius = 14
        bgView.layer.borderColor = UIColor.lightGray.cgColor
        bgView.layer.borderWidth = 0.5
        bgView.layer.shadowOpacity = 0.2
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowRadius = 5
        let shadowPath = CGRect(x: bgView.bounds.minX + 5, y: bgView.bounds.minY + 5, width: bgView.bounds.width - 10, height: bgView.bounds.height)
        bgView.layer.shadowPath = UIBezierPath(rect: shadowPath).cgPath
        genrePickerView.selectRow(Book.Genre.selectedIndex(from: thisBook?.genre ?? .action), inComponent: 0, animated: false)
        editButton.setTitle(thisBook == nil ? "Create" : "Update", for: .normal)
        updateDisability()
    }
    
    @IBSegueAction func toRatingsView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: RatingsView(passedInRating: thisBook?.rating ?? 0,updateRating: updateRating))
        
    }
    func updateDisability() {
        editButton.isEnabled = !(name.text == "" || author.text == "")
    }

    func updateRating(value: Int) {
        if thisBook != nil {
            thisBook!.rating = value
        } else {
            newRating = value
        }
    }
    
    @IBAction func updateBook(_ sender: Any) {
        if thisBook != nil {
            thisBook!.author = author.text ?? ""
            thisBook!.name = name.text ?? ""
            delegate?.newUpdate(book: thisBook!, new: false)
        } else {
            // Must be a new book
            let newBook = Book(name: name.text!,
                               author: author.text!,
                               genre: pickerData[genrePickerView.selectedRow(inComponent: 0)],
                               rating: newRating)
            delegate?.newUpdate(book: newBook, new: true)
        }
        

        dismiss(animated: true)
    }
}
extension EditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row].display
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        thisBook?.genre = pickerData[row]
    }
    
    
}
