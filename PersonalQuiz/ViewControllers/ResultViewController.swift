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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        setTypeAnimal()
        
    }
    
    private func setTypeAnimal() {
        var animals = [Animal]()
        var greatestMatchCount = 0
        
        for answer in answers {
            animals.append(answer.animal)
        }
        
        let animalsMatchCount = animals.reduce(into: [:]) { counts, animal in
            counts[animal, default: 0] += 1
        }
    
        for animal in animalsMatchCount {
            if animal.value > greatestMatchCount {
                greatestMatchCount = animal.value
                animalLabel.text = String(animal.key.rawValue)
                descriptionLabel.text = animal.key.definition
            }
        }
    }
}
