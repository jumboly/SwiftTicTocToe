//
//  Boad.swift
//  SwiftTicTacToe
//
//  Created by 木谷正則 on 2020/12/08.
//

import SwiftUI

struct Boad: View {
    let squares: [String]
    let onClick: (Int) -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                renderSquare(0)
                renderSquare(1)
                renderSquare(2)
            }
            HStack(spacing: 0) {
                renderSquare(3)
                renderSquare(4)
                renderSquare(5)
            }
            HStack(spacing: 0) {
                renderSquare(6)
                renderSquare(7)
                renderSquare(8)
            }
        }
    }
    
    func renderSquare(_ i: Int) -> some View {
        Square(value: squares[i], onClick: { onClick(i) })
    }
}

#if DEBUG
fileprivate
struct ContentView : View {
    @State var squares = Array(repeating: " ", count: 9)
    var body: some View {
        Boad(squares: squares, onClick: { i in squares[i] = "x" })
    }
}
#endif

struct Boad_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
