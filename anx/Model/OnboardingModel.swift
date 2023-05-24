//
//  OnboardingModel.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 13/05/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    var title: String
    var text1: String
    var text2: String
    var tag: Int
    let id = UUID()
    
    static var pages: [Page] = [
        Page(title: "Anxiety", text1: "Everyone has feelings of anxiety at some point in their life.", text2: "But, sometimes you have anxiety that can interfere with daily activities.", tag: 0),
        Page(title: "Anxiety", text1: "How do you know if it's normal anxiety or an anxiety disorder?", text2: "", tag: 1),
        Page(title: "Hamilton Anxiety Rating Scale\n(HAM-A)", text1: "Hamilton Anxiety Rating Scale can help you to measure your rates level of anxiety", text2: "This test is only used to measure the level of your anxiety disorder, not for diagnosis.", tag: 2)
    ]
}
