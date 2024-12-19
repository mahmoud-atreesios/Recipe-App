//
//  MockResult.swift
//  Recipe App
//
//  Created by Mahmoud Mohamed Atrees on 19/12/2024.
//

import Foundation

extension Result {
    static let mock = Result(
        id: 1,
        originalVideoURL: "https://example.com/video.mp4",
        country: "Italy",
        instructions: [Instruction.mock],
        userRatings: UserRatings.mock,
        name: "Creamy Pasta",
        createdAt: 1672531200,
        nutrition: Nutrition.mock,
        description: "Food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion.",
        thumbnailURL: "https://picsum.photos/400",
        language: "en",
        updatedAt: 1672531200,
        renditions: nil,
        sections: nil,
        tags: [Tag.mock],
        credits: [Credit.mock]
    )
}


extension Instruction {
    static let mock = Instruction(displayText: "Boil pasta until al dente.")
}

extension UserRatings {
    static let mock = UserRatings(score: 4.5)
}

extension Nutrition {
    static let mock = Nutrition(protein: 10, fat: 20, calories: 500)
}

extension Component {
    static let mock = Component(rawText: "200g pasta")
}

extension Tag {
    static let mock = Tag(name: "Italian")
}

extension Credit {
    static let mock = Credit(name: "Mahmoud Atrees")
}
