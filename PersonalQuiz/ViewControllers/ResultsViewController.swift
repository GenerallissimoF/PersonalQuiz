//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by brubru on 20.12.2021.
//

import UIKit


class ResultsViewController: UIViewController {
    var answers: [Answer]!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalDiscriptionLabel: UILabel!
    
    
    // 1. Передать сюда массив с ответами +
    // 2. Определить наиболее часто встречающийся тип животного +
    // 3. Отобразить результат в соответсвии с этим живтным +
    // 4. Избавится от кнопки возврата назад на экран результатов +

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        //подумал, что если присутствует картинка, то нужно метод получения этой картинки поместить сюда
        if let animalType = findAnimalType() {
                   updateSubviews(with: animalType)
               }

    }
    
    // Не нашел я подходящий алгоритм, сделал так
    private func findAnimalType() -> AnimalType? {
            guard let answers = answers else { return nil }
            var animalPack = [AnimalType: Int]()
            
            for answer in answers {
                if let counter = animalPack[answer.type] {
                    animalPack[answer.type] = counter + 1
                } else {
                    animalPack[answer.type] = 1
                }
            }
            let sortedAnimals = animalPack.sorted { $0.1 > $1.1 }
            return sortedAnimals.first?.key
        }

    private func updateSubviews(with type: AnimalType) {
            animalLabel.text = " Вы - \(type.rawValue)"
            animalDiscriptionLabel.text = type.definition
        }
    }
        

    
    
    
    
    
    
    
    


