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
        findAnimal ()
    }
    
    
   // знаю что можно было реализовать через добавление в пустой словарь экземпляров со свойствами, которые еще не содержаться в словаре, а также реализовать значение словаря как счетчик, тогда можно было бы легко масштабировать код если например число видов и экземпляров животных увеличится, но у миня не хватило скиллов
    private func findAnimal () {
        guard let arrayOfAnswers = answers else { return }
        // print(arrayOfAnswers)
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
                
            } else if animal.type == PersonalQuiz.AnimalType.rabbit {
                rabbitCount += 1
                animalPack.updateValue(rabbitCount, forKey: animal.type)
            }
            
            
        }
        let sortedAnimals = animalPack.sorted { $0.1 > $1.1 }
        guard let mainAnimal = sortedAnimals.first?.key else {return}
        animalLabel.text = " Вы - \(mainAnimal.rawValue)"
        animalDiscriptionLabel.text = mainAnimal.definition
        
    }
    
    
    
    
    
    
    
    
}

