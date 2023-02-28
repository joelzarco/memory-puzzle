//
//  ContentView.swift
//  memoryPuzzle
//
//  Created by Johel Zarco on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    private var sixColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @State var cards = createCardList().shuffled()
    
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        // georeader to get screen size and adapt cardView width's
        GeometryReader{geo in
            VStack{
                Text("Memory puzzle")
                    .font(.largeTitle)
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                    ForEach(cards){card in
                        CardView(card: card, MatchedCards: $MatchedCards, UserChoices: $UserChoices, cardWidth: getSizes(w: geo.size.width, h: geo.size.height))
                    } // forE
                } //LVG
                .padding([.leading, .trailing])
                Spacer()
                VStack{
                    Spacer()
                    Text("Match these cards to win:")
                    Spacer()
                    LazyVGrid(columns: sixColumnGrid, spacing: 5) {
                        ForEach(cardValues, id:\.self){ cardValue in
                            if(!MatchedCards.contains(where: { $0.text == cardValue } ) ){
                                Text(cardValue)
                                    .font(.system(size: 30))
                            }
                        } //
                    } //2nd LZV
                } //smallVs
                Spacer()
            } // VS
        } // Geo
    } // someV
    func getSizes(w : Double, h : Double) -> Int{
        print("geo.width : \(w), geo.heigth: \(h)")
        print(Int(h/18))
        return Int(h/18)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
