//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Mikita Ivanou on 19.11.25.
//
import Foundation

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    func store(correct count: Int, total amount: Int, date: Date)
}
