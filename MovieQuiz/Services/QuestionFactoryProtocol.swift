//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Mikita Ivanou on 13.11.25.
//

protocol QuestionFactoryProtocol: AnyObject {
    var delegate: QuestionFactoryDelegate? { get set }
    func requestNextQuestion()
}
