//
//  Question.swift
//  QuizApp
//
//  Created by Vaibhav Nandam on 7/5/18.
//  Copyright © 2018 Vaibhav Nandam. All rights reserved.
//

import Foundation
class Question{
    var questionText : String
    var answer : Bool
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}

