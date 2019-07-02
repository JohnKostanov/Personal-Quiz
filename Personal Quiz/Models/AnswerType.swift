//
//  AnswerType.swift
//  Personal Quiz
//
//  Created by Nikolay Naumenkov on 02/07/2019.
//  Copyright © 2019 iApps. All rights reserved.
//

enum AnswerType {
    case type1, type2, type3, type4
}

// MARK: - Definition

extension AnswerType {
    var definition: String {
        switch self {
        case .type1:
            return "def1"
        case .type2:
            return "def2"
        case .type3:
            return "def3"
        case .type4:
            return "def4"
        }
    }
}

// MARK: - Title

extension AnswerType {
    var title: String {
        switch self {
        case .type1:
            return "title1"
        case .type2:
            return "title2"
        case .type3:
            return "title3"
        case .type4:
            return "title4"
        }
    }
}
