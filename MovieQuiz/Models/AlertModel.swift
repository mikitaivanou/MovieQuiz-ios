//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Mikita Ivanou on 17.11.25.
//
import UIKit
struct AlertModel {
    var title: String
    var message: String
    var buttonText: String
    var completion: () -> Void
}
