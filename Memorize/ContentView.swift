//
//  ContentView.swift
//  Memorize
//
//  Created by InThing on 25.03.2024..
//

import SwiftUI

struct ContentView: View {
    @State var cardCount: Int = 4
    let emojis: Array<String> = ["👻", "🧠", "💋", "👀", "👀", "🦷", "🫀", "👃🏼", "🤚🏻", "💄", "👁️"]
    
    var body: some View {
        VStack{
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        
    }
    
    
    
    var cardCountAdjusters : some View {
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .foregroundColor(.blue)
        .padding()
    }
    
    func cardCountAdjuster(by offset: Int, symbol:String) -> some View {
        Button(action:{
            cardCount += offset
            
        }, label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1  || cardCount + offset > emojis.count)
    }
    
    
    
    
    var cardRemover : some View{
         cardCountAdjuster(by:-1, symbol: "rectangle.stack.badge.minus")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by:+1, symbol: "rectangle.stack.badge.plus")    }
    
    var cards : some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self)
            {
                index in
                CardView(content:emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
            
        }
        .foregroundColor(.orange)
            .padding()
            
    }}

struct CardView:  View{
    let content: String
    @State var isFaceUp = true
     var body: some View {
         ZStack {
             let base = RoundedRectangle(cornerRadius: 12)
             if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                base.foregroundColor(.black)
            }
             base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
