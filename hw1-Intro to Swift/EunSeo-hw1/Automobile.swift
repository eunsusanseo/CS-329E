//
//  Automobile.swift
//  EunSeo-hw1
//
//  Created by Eun Susan Seo on 1/29/17.
//  Copyright © 2017 Eun Susan Seo. All rights reserved.
//

import Foundation

class Automobile {
    // 1. Define 4 properties: _make, _model, _numberOfDoors, _speed
    //These are all private properties
    private var _make = "Toyota"
    private var _model = "RAV4"
    private var _numberOfDoors = 4
    private var _speed = 10
    
    
    //2. Define an init method with arguments for each property
    //Initialize all properties to their passed-in value
    init(_make: String, _model: String, _numberOfDoors: Int, _speed: Int) {
        self._make = _make
        self._model = _model
        self._numberOfDoors = _numberOfDoors
        self._speed = _speed
    }
    
    
    // 3. Create a class-lvl 'create' method with arguments for each property
        //Purpose: create and return instance of Automobile object, using passed in initial property values
    static func create(_make: String, _model: String, _numberOfDoors: Int, _speed: Int) -> Automobile {
        return Automobile(_make: _make, _model: _model, _numberOfDoors: _numberOfDoors, _speed: _speed)
    }
    
    
    // 4. Create get and set instance methods for each private property except the speed property (only get method)
    var make: String {
        get {
            return self._make
        }
        set (_make){
            self._make = _make
        }
    }
    
    var model: String {
        get {
            return self._model
        }
        set (_model) {
            self._model = model
        }
    }
    
    var numberOfDoors: Int {
        get {
            return self._numberOfDoors
        }
        set (_numberOfDoors) {
            self._numberOfDoors = numberOfDoors
        }
    }
    
    var speed: Int {
        get {
            return self._speed
        }
    }

    
    // 5. Create an 'increaseSpeed' method, with one arg named 'speedChange' of type integer
        //Make sure resulting speed not outside range of 0 to 150
    func increaseSpeed(speedChange: Int) -> UInt32 {
        self._speed += speedChange
        return UInt32(self._speed)
    }
    

    // 6. Create a 'decreaseSpeed' method, with one arg named 'speedChange' of type integer
        //Make sure resulting speed not outside range of 0 to 150
    func decreaseSpeed(speedChange: Int) -> UInt32 {
        self._speed -= speedChange
        return UInt32(self._speed)
    }
    
    
    // 7. Create a 'description' method that will return the following string:
        //Make: <make>, Model: <model>, NumDoors: <number-of-doors>, Speed: <speed>
    func description(_make: String, _model: String, _numberOfDoors: Int, _speed: Int) -> String {
        return "Make: \(_make), Model: \(_model), NumDoors: \(_numberOfDoors), Speed: \(_speed)"
    }
}
