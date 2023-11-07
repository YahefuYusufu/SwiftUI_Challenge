//
//  StoryViewViewModel.swift
//  ChooseOneStory
//
//  Created by yusufyakuf on 2023-11-07.
//

import Foundation

struct Story {
   let pages: [StoryPage]
   
   subscript(_ pageIndex: Int) -> StoryPage {
      return pages[pageIndex]
   }
}

struct StoryPage {
   let text: String
   let choices: [Choice]
   
   init(_ text: String, choices: [Choice]) {
      self.text = text
      self.choices = choices
   }
}

struct Choice {
   let text: String
   let destination: Int
}
