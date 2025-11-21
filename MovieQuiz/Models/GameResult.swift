//
//  GameResult.swift
//  MovieQuiz
//
//  Created by Mikita Ivanou on 19.11.25.
//
import Foundation
struct GameResult {
    var correct: Int
    var total: Int
    var date: Date
    func isBetterThan(_ another: GameResult) -> Bool {
        correct > another.correct
    }
}
