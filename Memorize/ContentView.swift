//
//  ContentView.swift
//  Memorize
//
//  Created by InThing on 25.03.2024..
//

import SwiftUI

struct ContentView: View {
    //ako se ovo stavi unutar HSTACK-a dodavanje nece da radi. Why?
    @State var cardCount: Int = 4
    let emojis: Array<String> = ["👻", "🧠", "💋", "👀", "👀", "🦷", "🫀", "👃🏼", "🤚🏻", "💄", "👁️"]
    var body: some View {
        HStack{
            ForEach(0..<cardCount, id: \.self)
            {
                index in
                CardView(content:emojis[index])
            }
            Button("AddCard")
            {
                cardCount += 1
            }
        }
        
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
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
