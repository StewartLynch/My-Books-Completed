//
//  Book.swift
//  My Books
//
//  Created by Stewart Lynch on 2021-09-03.
//  Copyright © 2021 Stewart Lynch. All rights reserved.
//

import Foundation


struct Book: Codable {
    enum Genre: String, CaseIterable, Codable {
        case action = "Action and Adventure"
        case classic
        case comic = "Comic or graphic Novel"
        case detective = "Detective and Mystery"
        case fantasy
        case historical = "Historical Fiction"
        case horror
        case literary = "Literary Fiction"
        case romance
        case scifi = "Science Fiction"
        case thriller = "Suspence and Thrillers"
        
        var display: String {
            self.rawValue.capitalized
        }
        var emoji: String {
            switch self {
            case .action:
                return "🎢"
            case .classic:
                return "🎭"
            case .comic:
                return "🤣"
            case .detective:
                return "🕵🏿‍♂️"
            case .fantasy:
                return "🦄"
            case .historical:
                return "⌛️"
            case .horror:
                return "🧟‍♂️"
            case .literary:
                return "📖"
            case .romance:
                return "💞"
            case .scifi:
                return "🚀"
            case .thriller:
                return "👀"
            }
        }
        
        static var pickerArray: [Genre] {
            Self.allCases.map { $0 }
        }
        
        static func selectedIndex(from genre: Genre) -> Int {
            return pickerArray.firstIndex{$0 == genre}!
        }
    }
    var id = UUID()
    var name: String
    var author: String
    var genre: Genre
    var rating: Int
    
    static var sampleBooks = [
        Book(name: "Life of Pi", author: "Yann Martel", genre: .action, rating: 5),
        Book(name: "The Three Muskateers", author: "Alexander Dumas", genre: .action, rating: 4),
        Book(name: "To Kill a Mockingbird", author: "Harper Lee", genre: .classic, rating: 4),
        Book(name: "Little Women", author: "Louisa May Alcott", genre: .classic, rating: 3),
        Book(name: "The Boy, the Mole, the Fox and the Horse", author: "Charlie Mackesy", genre: .comic, rating: 2),
        Book(name: "The Night Fire", author: "Michael Connely", genre: .detective, rating: 4),
        Book(name: "And Then There Were None.", author: "Agatha Christie", genre: .detective, rating: 3),
        Book(name: "Circe", author: "Madeline Miller", genre: .fantasy, rating: 3),
        Book(name: "Ninth House", author: "Leigh Bardugo", genre: .fantasy, rating: 4),
        Book(name: "The Help", author: "Kathryn Stockett", genre: .historical, rating: 5),
        Book(name: "One Hundred Years of Solitude", author: "Gabriel Marquez", genre: .historical, rating: 4),
        Book(name: "Carie", author: "Stephen King", genre: .horror, rating: 4),
        Book(name: "The Haunting of Hill House", author: "Laura Miller", genre: .horror, rating: 5),
        Book(name: "Where the Crawdads Sing", author: "Delia Owens", genre: .literary, rating: 5),
        Book(name: "Brazen and the Beast", author: "Sarah MacLean", genre: .romance, rating: 2),
        Book(name: "The Testaments", author: "Margaret Atwood", genre: .scifi, rating: 5),
        Book(name: "1984", author: "George Orwell", genre: .scifi, rating: 5),
        Book(name: "Gone Girl", author: "Gillian Flynn", genre: .thriller, rating: 2),
        Book(name: "The Guardians", author: "John Grisham", genre: .thriller, rating: 3)
    ]
    
}
