//
//  ContentView.swift
//  Memorize
//
//  Created by InThing on 25.03.2024..
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            let emojis: Array<String> = ["👻", "🧠", "💋", "👀"];
            ForEach(emojis.indices, id: \.self)
            {
                index in
                CardView(content:emojis[index])
            }
        }
        
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
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
