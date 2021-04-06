//
//  UserProfile.swift
//  LessonThreeCorrection
//
//  Created by Philip Noskov on 04.04.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "User",
             password: "12345678",
             person: Person.getPerson()
        )
    }
    
}


struct Person {
    let name: String
    let surname: String
    let age: String
    let region: String
    let city: String
    let phoneNumber: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Philip",
               surname: "Moscow",
               age: "29",
               region: "Russia",
               city: "St. Petersburg",
               phoneNumber: "+7 999 567 23 23"
        )
    }
}
