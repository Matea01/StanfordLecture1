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
    //ako se ovo stavi unutar HSTACK-a dodavanje nece da radi. Why?
    
    var body: some View {
        VStack{
            cards
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
    var cards : some View {
        LazyVGrid(columns:[GridItem(),GridItem(), GridItem()]){
            ForEach(0..<cardCount, id: \.self)
            {
                index in
                CardView(content:emojis[index])
            }
            
        }
        .foregroundColor(.orange)
            .padding()
            
    }
    var cardRemover : some View{
        Button(action:{
            if(cardCount<emojis.count){
                cardCount += 1
            }
        }, label:{
            Image(systemName: "rectangle.stack.badge.plus")
        })
    }
    var cardAdder: some View {
        Button(action:{
            if(cardCount>1){
                cardCount -= 1
            }
        }, label:{
            Image(systemName: "rectangle.stack.badge.minus")
        })
    }
}

struct CardView:  View{
    let content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else {
                base.foregroundColor(.black)
            }
        }
        .onTapGesture {
            print("tapped")
        }
    }
}

#Preview {
    ContentView()
}
