//
//  ViewController.swift
//  Project-game
//
//  Created by Sergey on 14/11/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var sumTapped = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
        
        // Do any additional setup after loading the view.
    }
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "Where country of " + countries[correctAnswer].uppercased() + "? Your try: \(sumTapped) of 10"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            sumTapped += 1
            
        } else {
            title = "Wrong, this is flag \(countries[correctAnswer])."
            self.score -= 1
            sumTapped += 1
            }
        //title = "Your made 10 attempts"
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Сontinue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        //else if sumTapped == 10 {
        }
}

