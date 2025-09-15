//
//  BookModel.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/8/25.
//

import Foundation

struct APIResponse: Codable {
  let data: [BookData]
}

struct BookData: Codable {
  let attributes: Book
}

struct Book: Codable {
  var id: UUID
  var title: String
  var author: String
  var pages: Int
  var releaseDate: String
  var dedication: String
  var summary: String
  var wiki: String
  var chapters: [Chapter]

  enum CodingKeys: String, CodingKey {
    case title, author, pages, dedication, summary, wiki, chapters
    case releaseDate = "release_date"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = UUID()
    title = try container.decode(String.self, forKey: .title)
    author = try container.decode(String.self, forKey: .author)
    pages = try container.decode(Int.self, forKey: .pages)
    releaseDate = try container.decode(String.self, forKey: .releaseDate)
    dedication = try container.decode(String.self, forKey: .dedication)
    summary = try container.decode(String.self, forKey: .summary)
    wiki = try container.decode(String.self, forKey: .wiki)
    chapters = try container.decode([Chapter].self, forKey: .chapters)
  }
}

struct Chapter: Codable {
  var title: String
}
