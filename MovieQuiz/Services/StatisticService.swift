//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Mikita Ivanou on 19.11.25.
//
import Foundation

final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    var result = GameResult(correct: 0, total: 0, date: Date())
    var totalCorrect: Int {
        get {
            storage.integer(forKey: "correctAnswerCount")
        }
        set {
            storage.set(newValue, forKey: "correctAnswerCount")
        }
    }
    
    var totalQuestions: Int {
        get {
            storage.integer(forKey: "totalQuestionCount")
        }
        set {
            storage.set(newValue, forKey: "totalQuestionCount")
        }
    }
    var gamesCount: Int {
        get {
            storage.integer(forKey: "gamesCount")
        }
        set {
            storage.set(newValue, forKey: "gamesCount")
        }
    }
    
    private let correctKey = "correct"
    private let totalKey = "total"
    private let dateKey = "date"
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: correctKey)
            let total = storage.integer(forKey: totalKey)
            let date = storage.object(forKey: dateKey) as? Date ?? Date()
            
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            storage.set(newValue.correct, forKey: correctKey)
            storage.set(newValue.total, forKey: totalKey)
            storage.set(newValue.date,   forKey: dateKey)
        }
    }
    
    var totalAccuracy: Double {
        get {
            storage.double(forKey: "totalAccuracy")
        }
        set {
            storage.set(newValue, forKey: "totalAccuracy")
        }
    }
    
    func store(correct count: Int, total amount: Int, date: Date) {
        result = GameResult(correct: count, total: amount, date: date)
        if result.isBetterThan(bestGame){
            bestGame = result
        }
        self.gamesCount += 1
        self.totalQuestions += amount
        self.totalCorrect += count
        self.totalAccuracy = (Double(self.totalCorrect) / Double(self.totalQuestions))*100
    }
    
    
}
