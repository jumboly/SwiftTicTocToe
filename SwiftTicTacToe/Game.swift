//
//  Game.swift
//  SwiftTicTacToe
//
//  Created by 木谷正則 on 2020/12/08.
//

import SwiftUI

struct History: Identifiable {
    var id: Int
    var squares: [String]
}

extension History: CustomStringConvertible {
    var description: String {
        if self.id == 0 {
            return "Go to start"
        } else {
            return "Go to move #\(self.id)"
        }
    }
}

struct Game: View {
    @State var history = [History(id: 0, squares: Array(repeating: " ", count: 9))]
    @State var stepNumber = 0;
    @State var xIsNext = true
    
    var body: some View {
        let squares = self.history.last!.squares
        let winner = calculateWinner(squares)
        let status = winner != nil
            ? "Winner: \(winner!)"
            : "Next player: \(xIsNext ? "❌" : "⭕")"
        
        return
            VStack {
                Text(status)
                Boad(
                    squares: squares,
                    onClick: { handlerClick($0) })
                List(history) { h in
                    Button(action: {jumpTo(h.id)}) {
                        Text(h.description)
                    }
                }
            }
    }
    
    func handlerClick(_ i: Int) {
        var history = self.history
        
        var current = history.last!
        if calculateWinner(current.squares) != nil {
            return
        }

        current.id += 1
        current.squares[i] = xIsNext ? "❌" : "⭕"
        
        history.append(current)
        
        self.history = history
        self.stepNumber = history.count
        self.xIsNext.toggle()
    }

    func calculateWinner(_ squares: [String]) -> String? {
        let lines = [
            // よこ
            (0, 1, 2),
            (3, 4, 5),
            (6, 7, 8),
            
            // たて
            (0, 3, 6),
            (1, 4, 7),
            (2, 5, 8),
            
            // ななめ
            (0, 4, 8),
            (2, 4, 6),
        ]
        
        for (a, b, c) in lines {
            if squares[a].trimmingCharacters(in: .whitespaces).isEmpty {
                continue
            }
            if squares[a] == squares[b] && squares[b] == squares[c] {
                return squares[a]
            }
        }
        return nil
    }
    
    func jumpTo(_ step: Int) {
        self.history = Array(self.history[...step])
        self.stepNumber = step
        self.xIsNext = step % 2 == 0
    }
}

struct Game_Previews: PreviewProvider {
    static var previews: some View {
        Game()
    }
}
