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
    
    
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встречающийся тип животного
    // 3. Отобразить результат в соответсвии с этим живтным
    // 4. Избавится от кнопки возврата назад на экран результатов

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let arrayOfAnswers = answers else { return }
        var catCount = 0
        var dogCount = 0
        var turtleCount = 0
        var rabbitCount = 0
        var animalPack = [PersonalQuiz.AnimalType: Int]()
        for animal in arrayOfAnswers {
            
            
            if animal.type == PersonalQuiz.AnimalType.cat {
                catCount += 1
                animalPack.updateValue(catCount, forKey: animal.type)
                
            } else if animal.type == PersonalQuiz.AnimalType.dog {
                dogCount += 1
                animalPack.updateValue(dogCount, forKey: animal.type)
                
            } else if animal.type == PersonalQuiz.AnimalType.turtle {
                turtleCount += 1
                animalPack.updateValue(turtleCount, forKey: animal.type)
                
            } else if animal.type == PersonalQuiz.AnimalType.dog {
                rabbitCount += 1
                animalPack.updateValue(rabbitCount, forKey: animal.type)
        }
            
    
        }
        print(animalPack)
       // if dogCount > catCount  {
         //   let dog = AnimalType.dog
         //   animalLabel.text = " Вы \(dog.rawValue)"
        }
            
         
        
    
    
    
    


}

