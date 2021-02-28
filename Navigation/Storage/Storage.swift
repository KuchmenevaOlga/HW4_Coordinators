//
//  Storage.swift
//  Navigation
//
//  Created by Ольга Кучменева on 22.10.2020.
//  Copyright © 2020 Olga Kuchmeneva. All rights reserved.
//


import Foundation

struct Storage {
    static var posts = [
        [
            Photos(imageFirst: "photo1", imageSecond: "photo2", imageThird: "photo3", imageFourth: "photo4")
        ],
        [
            Post(image: "1", author: "Funny_Cat", likes: 221, views: 432, description: "Сделала себе новую прическу, как вам? Оцените лайками"),
            Post(image: "2", author: "Catty", likes: 32, views: 42, description: "Встретились наконец с @о_о. Не виделись несколько месяцев, а у нее уже 7 детей!"),
            Post(image: "3", author: "Barsik", likes: 221, views: 432, description: "Опять переел корма"),
            Post(image: "4", author: "Kot", likes: 522, views: 5566, description: "Кошечки, повторяем за мной. Это мое авторское упражнение под названием Куб, помогает отдохнуть, расслабиться и исчезнуть из поля зрения")
        ]
    ]
    
    static var photos = [
        [
           Photo(image: #imageLiteral(resourceName: "photo1")),
           Photo(image: #imageLiteral(resourceName: "photo2")),
           Photo(image: #imageLiteral(resourceName: "photo3")),
           Photo(image: #imageLiteral(resourceName: "photo4")),
           Photo(image: #imageLiteral(resourceName: "photo5")),
           Photo(image: #imageLiteral(resourceName: "photo6")),
           Photo(image: #imageLiteral(resourceName: "photo7")),
           Photo(image: #imageLiteral(resourceName: "photo8")),
           Photo(image: #imageLiteral(resourceName: "photo9")),
           Photo(image: #imageLiteral(resourceName: "photo10")),
           Photo(image: #imageLiteral(resourceName: "photo11")),
           Photo(image: #imageLiteral(resourceName: "photo12")),
           Photo(image: #imageLiteral(resourceName: "photo13")),
           Photo(image: #imageLiteral(resourceName: "photo14")),
           Photo(image: #imageLiteral(resourceName: "photo15")),
           Photo(image: #imageLiteral(resourceName: "photo16")),
           Photo(image: #imageLiteral(resourceName: "photo17")),
           Photo(image: #imageLiteral(resourceName: "photo18")),
           Photo(image: #imageLiteral(resourceName: "photo19")),
           Photo(image: #imageLiteral(resourceName: "photo20"))
        ]
    ]
}

