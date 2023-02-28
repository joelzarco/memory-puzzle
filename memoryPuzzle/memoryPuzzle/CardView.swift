//
//  CardView.swift
//  memoryPuzzle
//
//  Created by Johel Zarco on 24/02/23.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card : Card
    
    @Binding var MatchedCards : [Card]
    @Binding var UserChoices : [Card]
    
    var cardWidth : Int
    
    var body: some View {
        if(card.isFaceUp || MatchedCards.contains(where: { $0.id == card.id } ) ) {
//            Text(card.text)
//            .font(.system(size: 50))
//            .padding()
//            .frame(width: CGFloat(cardWidth), height: CGFloat(cardWidth))
//            .background(.secondary)
//            .cornerRadius(10)
            TextCardView(text: card.text, myWidth: CGFloat(cardWidth))
//                .frame(width: CGFloat(cardWidth), height: CGFloat(cardWidth))
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.systemPink), lineWidth: 3)
                }
            
        } else{ // if ||
            TextCardView(text: "?", myWidth: CGFloat(cardWidth))
                .overlay {
                    RoundedRectangle(cornerRadius: 10).stroke(Color(.systemTeal), lineWidth: 3)
                }
                .onTapGesture {
                    if(UserChoices.count == 0){
                        card.turnOver()
                        UserChoices.append(card)
                    } else if(UserChoices.count == 1){
                        card.turnOver()
                        UserChoices.append(card)
                        withAnimation(Animation.linear.delay(1)){
                            for thisCard in UserChoices{
                                thisCard.turnOver()
                            }
                        }
                        checkForMatch()
                    }
                } //tapG
        } //else
    } // someV
    func checkForMatch(){
        if(UserChoices[0].text == UserChoices[1].text){
            MatchedCards.append(UserChoices[0])
            MatchedCards.append(UserChoices[1])
        }
        UserChoices.removeAll()
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView()
//    }
//}
