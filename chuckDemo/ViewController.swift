//
//  ViewController.swift
//  chuckDemo
//
//  Created by William Lennartsson on 2020-02-04.
//  Copyright © 2020 William Lennartsson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getJokePressed(_ sender: UIButton) {
        print("Get joke button pressed")
        let chuckApi = ChuckAPI()
        chuckApi.getRandomJoke { (result) in
            switch result {
            case .success(let joke):
                print("Value: " + joke.value)
                DispatchQueue.main.async {
                    // Uppdatera UI
                }
            case .failure(let error): print("Error \(error)")
            }
        }
    }
    
}

