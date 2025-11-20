//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Mikita Ivanou on 15.11.25.
//

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(_ question: QuizQuestion?)
}
