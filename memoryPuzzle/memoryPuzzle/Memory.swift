//
//  Memory.swift
//  memoryPuzzle
//
//  Created by Johel Zarco on 24/02/23.
//

import Foundation
import SwiftUI

class Card: Identifiable, ObservableObject{
    var id = UUID()
    
    @Published var isFaceUp = false
    @Published var isMatched = false
    
    var text : String
    
    init(text : String){
        self.text = text
    }
    
    func turnOver(){
        self.isFaceUp.toggle()
    }
}

let cardValues : [String] = ["🦑", "🍤", "🦞", "🐡", "🦀", "🐠", "🐟", "🐬", "🐳", "🦭", "🐊", "🐙"]

func createCardList() -> [Card]{
    var cardList = [Card]()
    
    for cardValue in cardValues{
        // doble append to have pairs in the puzzle
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    return cardList
}

let faceDownCard = Card(text: "?")
