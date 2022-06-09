////
////  Story.swift
////  arx-app
////
////  Created by Seth Erickson on 6/8/22.
////
//
//import Foundation
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
//
//// MARK: - Welcome
//struct Story: Codable {
//    let clientID, storyID: String
//    let activities: [Activity]
//    let createdDate, lastModifiedDate: String
//    let map: [Map]
//    let mascot: Mascot
//    let numberOfSteps: Int
//    let storyName: String
//    let storyOnboardingSteps: [StoryOnboardingStep]
//    let theme: Theme
//
//    enum CodingKeys: String, CodingKey {
//        case clientID = "client_id"
//        case storyID = "story_id"
//        case activities
//        case createdDate = "created_date"
//        case lastModifiedDate = "last_modified_date"
//        case map, mascot
//        case numberOfSteps = "number_of_steps"
//        case storyName = "story_name"
//        case storyOnboardingSteps = "story_onboarding_steps"
//        case theme
//    }
//}
//
//// MARK: - Activity
//struct Activity: Codable {
//    let activityDescription: String
//    let activityElements: [ActivityElement]
//    let activityID, activityName: String
//    let activityOrder, numberOfPlays: Int
//    let parentActivityID: String
//
//    enum CodingKeys: String, CodingKey {
//        case activityDescription = "activity_description"
//        case activityElements = "activity_elements"
//        case activityID = "activity_id"
//        case activityName = "activity_name"
//        case activityOrder = "activity_order"
//        case numberOfPlays = "number_of_plays"
//        case parentActivityID = "parent_activity_id"
//    }
//}
//
//// MARK: - ActivityElement
//struct ActivityElement: Codable {
//    let activityType: String
//    let websiteURL, correctAnswer, questionType: String?
//    let quizAnswers: QuizAnswers?
//    let quizQuestion: String?
//    let arModelInstructions: [ArModelInstruction]?
//
//    enum CodingKeys: String, CodingKey {
//        case activityType = "activity_type"
//        case websiteURL = "website_url"
//        case correctAnswer = "correct_answer"
//        case questionType = "question_type"
//        case quizAnswers = "quiz_answers"
//        case quizQuestion = "quiz_question"
//        case arModelInstructions = "ar_model_instructions"
//    }
//}
//
//// MARK: - QuizAnswers
//struct QuizAnswers: Codable {
//    let option1, option2, option3, option4: String
//
//    enum CodingKeys: String, CodingKey {
//        case option1 = "option_1"
//        case option2 = "option_2"
//        case option3 = "option_3"
//        case option4 = "option_4"
//    }
//}
//
//// MARK: - Map
//struct Map: Codable {
//    let x, y: Double
//}
//
//// MARK: - ArModelInstruction
//struct ArModelInstruction: Codable {
//    let modelID: String
//    let modelElements: ModelElements
//
//    enum CodingKeys: String, CodingKey {
//        case modelID = "model_id"
//        case modelElements = "model_elements"
//    }
//}
//
//// MARK: - ModelElements
//struct ModelElements: Codable {
//    let actions: Actions
//    let anchorType: AnchorType
//    let displayDistanceFromArModel: Bool
//    let id: String
//    let isAutomaticLoad: Bool
//    let model, modelName: String
//    let modelScale: Double
//    let movementInstructions: [MovementInstruction]
//    let startingPosition: [Double]
//
//    enum CodingKeys: String, CodingKey {
//        case actions
//        case anchorType = "anchor_type"
//        case displayDistanceFromArModel = "display_distance_from_ar_model"
//        case id
//        case isAutomaticLoad = "is_automatic_load"
//        case model
//        case modelName = "model_name"
//        case modelScale = "model_scale"
//        case movementInstructions = "movement_instructions"
//        case startingPosition = "starting_position"
//    }
//}
//
//// MARK: - Actions
//struct Actions: Codable {
//    let buttonAction: [ButtonAction]?
//    let collisionInitAction, collisionReceivedAction, tapAction: Action?
//
//    enum CodingKeys: String, CodingKey {
//        case buttonAction = "button_action"
//        case collisionInitAction = "collision_init_action"
//        case collisionReceivedAction = "collision_received_action"
//        case tapAction = "tap_action"
//    }
//}
//
//// MARK: - ButtonAction
//struct ButtonAction: Codable {
//    let buttonAlignment: JSONNull?
//    let buttonSize: [Int]
//    let buttonText: String
//    let instructions: [Instruction]
//
//    enum CodingKeys: String, CodingKey {
//        case buttonAlignment = "button_alignment"
//        case buttonSize = "button_size"
//        case buttonText = "button_text"
//        case instructions
//    }
//}
//
//// MARK: - Instruction
//struct Instruction: Codable {
//    let actionDuration: ActionDuration
//    let audio: Audio
//    let completesExperience: Bool
//    let createModelByID, displayedInformation: String?
//    let removeWhenDone: Bool
//    let rotation: Rotation?
//    let scale: ActionDuration
//    let translation: [Int]?
//
//    enum CodingKeys: String, CodingKey {
//        case actionDuration = "action_duration"
//        case audio
//        case completesExperience = "completes_experience"
//        case createModelByID = "create_model_by_id"
//        case displayedInformation = "displayed_information"
//        case removeWhenDone = "remove_when_done"
//        case rotation, scale, translation
//    }
//}
//
//enum ActionDuration: Codable {
//    case double(Double)
//    case integer(Int)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(Double.self) {
//            self = .double(x)
//            return
//        }
//        throw DecodingError.typeMismatch(ActionDuration.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ActionDuration"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .double(let x):
//            try container.encode(x)
//        case .integer(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//// MARK: - Audio
//struct Audio: Codable {
//    let after, before: JSONNull?
//    let during: String?
//}
//
//// MARK: - Rotation
//struct Rotation: Codable {
//    let axis: [Int]
//    let degrees: Int
//}
//
//// MARK: - Action
//struct Action: Codable {
//    let instructions: [Instruction]
//}
//
//// MARK: - AnchorType
////struct AnchorType: Codable {
////    let world: Bool?
////    let image: Image?
////}
////
////// MARK: - Image
////struct Image: Codable {
////    let heightMeters: Double
////    let imageURL: String
////    let name: String
////    let widthMeters: Double
////
////    enum CodingKeys: String, CodingKey {
////        case heightMeters = "height_meters"
////        case imageURL = "image_url"
////        case name
////        case widthMeters = "width_meters"
////    }
////}
//
//// MARK: - MovementInstruction
//struct MovementInstruction: Codable {
//    let moveRelativeTo: String
//    let position: [Int]
//    let time: Int
//
//    enum CodingKeys: String, CodingKey {
//        case moveRelativeTo = "move_relative_to"
//        case position, time
//    }
//}
//
//// MARK: - Mascot
//struct Mascot: Codable {
//    let image1, image2, image3, image4: String
//
//    enum CodingKeys: String, CodingKey {
//        case image1 = "image_1"
//        case image2 = "image_2"
//        case image3 = "image_3"
//        case image4 = "image_4"
//    }
//}
//
//// MARK: - StoryOnboardingStep
//struct StoryOnboardingStep: Codable {
//    let stepNumber: Int
//    let stepText: String
//
//    enum CodingKeys: String, CodingKey {
//        case stepNumber = "step_number"
//        case stepText = "step_text"
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
