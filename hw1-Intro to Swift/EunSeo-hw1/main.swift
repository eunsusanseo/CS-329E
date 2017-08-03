//
//  main.swift
//  EunSeo-hw1
//
//  Created by Eun Susan Seo on 1/29/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import Foundation

func randomValueBetween(min:UInt32, max:UInt32) -> UInt32 {
    let randomValue:UInt32 = min + arc4random_uniform(UInt32(max - min + 1))
    return randomValue
}

//Define a 'main' global-scope function, with no arguments

func main() {
    
    print("heyyyyyyy")
    
    //create a list of automobile objects
    var carList:[Automobile] = []
    //or var carList = [Automobile]() <-- difference??
    //var carList = Automobile[]
    
    //1. Create 3 Automobile objects with properties that produce desired output using the create method
    let car1 = Automobile.create(_make: "Maserati", _model: "GranTurismo", _numberOfDoors: 2, _speed: 67)
    //print(car1.description)
    let car2 = Automobile.create(_make: "Honda", _model: "Accord", _numberOfDoors: 4, _speed: 128)
    let car3 = Automobile.create(_make: "Tesla", _model: "S 90", _numberOfDoors: 2, _speed: 35)
    
    //put all cars in a list
    carList.append(car1)
    carList.append(car2)
    carList.append(car3)

    
    for car in carList {
        print(car.description)
    }

    // 2. Define a loop that iterates 10 times, calling the increaseSpeed method on each Automobile object, passing in a random value that is returned from the randomValueBetween function
    
    //loop through all cars, for each car, call the increaseSpeed function
    
    for car in carList {
        for _ in 1...10 {
            let speed = randomValueBetween(min: 0, max: 16)
            car.increaseSpeed(speedChange: Int(speed)) //finds car1.speed += speed, returns car1.speed
        }
    }
    
    // 3. After loop completed, loop through all cars and use description method to output final state of each obj's
    //for car in carList {
        //print(car1.description())
    //}
    
    
    // 4. Last thing main funtion does: output msg for which automobile won the race
    //Format: <automobile make> <automobile model> won!!”. Or, in the unusual event there is a tie, output “There was a tie!”.
    //Winner determined by greater speed
    //for car in carList {
        //if
    //}
    
    //loop through car list and if loop--first check if any speed the same, then iterate through to see who has highest speed

}

