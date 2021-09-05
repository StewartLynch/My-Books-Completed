//
//  BooksTableViewCell.swift
//  My Books
//
//  Created by Stewart Lynch on 2021-09-03.
//  Copyright © 2021 Stewart Lynch. All rights reserved.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var emoji: UILabel!
    @IBOutlet weak var rating: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(for thisBook: Book) {
        name.text = thisBook.name
        author.text = thisBook.author
        genre.text = thisBook.genre.display
        emoji.text = thisBook.genre.emoji
        rating.image = UIImage(named: "R\(thisBook.rating)")!
    }

}
