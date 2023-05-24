//
//  QuestionModel.swift
//  anx
//
//  Created by Aiffah Kiysa Waafi on 08/05/23.
//

import Foundation

struct QuestionModel {
    var img : String?
    var title : String?
    var question : String?
}

var question : [QuestionModel] = [
    QuestionModel(img: "ImageQuestion1", title: "Anxious", question: "Worries, anticipation of the worst, fearful anticipation, irritability."),
    QuestionModel(img: "ImageQuestion2", title: "Tension", question: "Feelings of tension, fatigability, startle response, moved to tears easily, trembling, feelings of restlessness, inability to relax."),
    QuestionModel(img: "ImageQuestion3", title: "Fears", question: "Of dark, of strangers, of being left alone, of animals, of traffic, of crowds."),
    QuestionModel(img: "ImageQuestion4", title: "Insomnia", question: "Difficulty in falling asleep, broken sleep, unsatisfying sleep and fatigue on waking, dreams, nightmares, night terrors."),
    QuestionModel(img: "ImageQuestion5", title: "Intellectual", question: "Difficulty in concentration, poor memory."),
    QuestionModel(img: "ImageQuestion6", title: "Depressed mood", question: "Loss of interest, lack of pleasure in hobbies, depression, early waking, diurnal swing."),
    QuestionModel(img: "ImageQuestion7", title: "Somatic (muscular)", question: "Pains and aches, twitching, stiffness, myoclonic jerks, grinding of teeth, unsteady voice, increased muscular tone."),
    QuestionModel(img: "ImageQuestion8", title: "Somatic (sensory)", question: "Tinnitus, blurring of vision, hot and cold flushes, feelings of weakness, pricking sensation."),
    QuestionModel(img: "ImageQuestion9", title: "Cardiovascular symptoms", question: "Of dark, of strangers, of being left alone, of animals, of traffic, of crowds."),
    QuestionModel(img: "ImageQuestion10", title: "Respiratory symptoms", question: "Pressure or constriction in chest, choking feelings, sighing, dyspnea."),
    QuestionModel(img: "ImageQuestion11", title: "Gastrointestinal symptoms", question: "Difficulty in swallowing, wind abdominal pain, burning sensations, abdominal fullness, nausea, vomiting, borborygmi, looseness of bowels, loss of weight, constipation."),
    QuestionModel(img: "ImageQuestion12", title: "Genitourinary symptoms", question: "Frequency of micturition, urgency of micturition, amenorrhea, menorrhagia, development of frigidity, premature ejaculation, loss of libido, impotence."),
    QuestionModel(img: "ImageQuestion13", title: "Autonomic symptoms", question: "Dry mouth, flushing, pallor, tendency to sweat, giddiness, tension headache, raising of hair."),
    QuestionModel(img: "ImageQuestion14", title: "Behavior at interview", question: "Fidgeting, restlessness or pacing, tremor of hands, furrowed brow, strained face, sighing or rapid respiration, facial pallor, swallowing, etc.")
    
]

func SaveScore(question : String , score : Double){
    UserDefaults.standard.set(score, forKey: question)
}
 
func LoadScore (question : String) -> Int{
    return UserDefaults.standard.integer(forKey: question)
}
