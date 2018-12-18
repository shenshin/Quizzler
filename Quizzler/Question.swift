//
//  Question.swift
//  Quizzler
//
//  Created by Ales Shenshin on 15/12/2018.
//  Copyright (c) 2018 Shenshin. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnswer: Bool){
        self.questionText = text
        self.answer = correctAnswer
    }
}
