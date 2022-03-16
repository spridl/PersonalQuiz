//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    private var yourAnimal: Character = "a"
    private var definition = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        setTypeAnimal()
        
        animalLabel.text = "ВЫ \(yourAnimal)"
        descriptionLabel.text = definition
    }
    
    private func setTypeAnimal() {
        var animals = [Animal]()
        
        for answer in answers {
            animals.append(answer.animal)
        }
        
        let animalsMatchCount = animals.reduce(into: [:]) { counts, animal in
            counts[animal, default: 0] += 1
        }
        
        var greatestMatchCount = 0
        for animal in animalsMatchCount {
            if animal.value > greatestMatchCount {
                greatestMatchCount = animal.value
                yourAnimal = animal.key.rawValue
                definition = animal.key.definition
            }
        }
    }
}
