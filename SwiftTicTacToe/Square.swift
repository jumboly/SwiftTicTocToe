//
//  Square.swift
//  SwiftTicTacToe
//
//  Created by 木谷正則 on 2020/12/08.
//

import SwiftUI

struct Square: View {
    private let value: String
    private let onClick: () -> Void
    
    init(value: String, onClick: @escaping () -> Void) {
        self.value = value
        self.onClick = onClick
    }
    
    var body: some View {
        Button(action: onClick) {
            Text(value)
        }
        .frame(width: 40, height: 40, alignment: .center)
        .background(Color.white)
        .border(Color.black, width: 1)
    }
}

#if DEBUG
fileprivate
struct ContentView: View {
    @State var value: String
    var body: some View {
        Square(value: value) {
            value = "⭕"
        }
    }
}
#endif

struct Square_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(value: "❌")
    }
}
