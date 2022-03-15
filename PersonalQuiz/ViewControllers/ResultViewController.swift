//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 4. Избавиться от кнопки возврата назад на экране результатов

    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    private var yourAnimal: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTypeAnimal()
        animalLabel.text = "ВЫ \(yourAnimal.rawValue)"
        descriptionLabel.text = yourAnimal.definition
    }
    
    private func setTypeAnimal() {
        var animals = [Animal]()
        for answer in answers {
            animals.append(answer.animal)
        }
        let animalsMatchCount = animals.reduce(into: [:]) { counts, letter in
            counts[letter, default: 0] += 1
        }
        var greatestMatchCount = 0
        for animal in animalsMatchCount {
            if animal.value > greatestMatchCount {
                greatestMatchCount = animal.value
                yourAnimal = animal.key
            }
        }
    }
}
