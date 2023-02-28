//
//  TextCardView.swift
//  memoryPuzzle
//
//  Created by Johel Zarco on 27/02/23.
//

import SwiftUI

struct TextCardView: View {
//    @ObservedObject var card : Card
    var text : String
    var myWidth : CGFloat
    
    var body: some View {
        Text(text)
            .frame(width: myWidth, height: myWidth)
            .font(.largeTitle)
            .padding()
            .background(.secondary)
            .cornerRadius(10)
    }
}

//struct TextCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextCardView()
//    }
//}
