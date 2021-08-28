//
//  User.swift
//  LoginApp
//
//  Created by Александр on 27.08.21.
//
import UIKit

struct User {
    var login: String
    var password: String
    var person: Person
    
    static func getUsernfo() -> User {
        User(
            login: "Alex",
            password: "password",
            person: Person(
                fullName: "Alexandr Meyer",
                hobbies: "Привет, меня зовут Александр, мне 34 года, живу в Беларуси, до недавнего времени профессиональный игрок в покер. В настоящее время изучаю мобильную разработку под iOS, начал с нуля, никогда не сталкивался с програмированием, однако это оказалось интереснее чем я думал 😀. В свободное время обожаю играть в Мафию, если не пробовали, то рекомендую!",
                photo: ["water","Mont"]
           )
        )
    }
}

struct Person {
    let fullName: String
    let hobbies: String
    let photo: [String]
}
