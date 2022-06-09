////
////  TaskViewModel.swift
////  AREA
////
////  Created by Eli Allen on 1/17/22.
////
//
//import Foundation
//import CoreGraphics
//
//class TaskViewModel: ObservableObject {
//    @Published var theTask: Activity?
//    @Published var mappedTasks: [Activity] = []
//
//    func getData(){
//        // make the api call
//        RestAPI.getData(from: URLRequests.allTasks , as: AWSTasks.self) { awsTasks in
//            // the dispatchQueue should be called here. not in the parent function
//            DispatchQueue.main.async {
//                self.mappedTasks = awsTasks.items
//            }
//
//        }
//    }
//
//    func getTask(id: String){
//        // get the http get request url
//        let url = URLRequests.taskBy(taskID: id)
//
//        // make the api call
//        RestAPI.getData(from: url , as: AWSTasks.self) { awsTasks in
//            // the dispatchQueue should be called here. not in the parent function
//            DispatchQueue.main.async { self.theTask = awsTasks.items[0] }
//        }
//    }
//
//    func getTask(blipTitle: String){
//        // get the http get request url
//        let url = tempCovertBlipTitleToHttpGetUrl(blipTitle)
//
//        // make the api call
//        RestAPI.getData(from: url , as: AWSSingleTask.self) { awsTasks in
//            // the dispatchQueue should be called here. not in the parent function
//            DispatchQueue.main.async { self.theTask = awsTasks.item }
//        }
//    }
//
//    func tempCovertBlipTitleToHttpGetUrl(_ title: String) ->String {
//        switch(title){
//        case "1. HQ":
//            return URLRequests.taskBy(taskID: "84117b7b-8b2e-4820-9d2e-a04ae158b2bb")
//        case "2. Analyze New Specimen":
//            return URLRequests.taskBy(taskID: "e115831b-c1d2-4deb-b8b9-61a6e62f271f")
//        case "3. Simulation":
//            // not an ar view
//            return URLRequests.taskBy(taskID: "4df24b4e-a139-4ab0-b1ca-8d0d266a847c")
//        case "4. Find the Mask":
//            return URLRequests.taskBy(taskID: "5430c148-e4ba-40a5-bc62-5331c8bd80c4")
//        case "5. Find the Testing Kit":
//            return URLRequests.taskBy(taskID: "29527e8c-1a9d-4a7a-b330-0f9e0f7ea9c6")
//        default:
//            // we had a code that we were not expecting
//            return ""
//        }
//
//    }
//
//    struct URLRequests{
//
//        // I believe this should be the only necessary function.
//        static func getStoryByID(storyID id: String) -> String {
//            return "https://c1uujeigj3.execute-api.us-west-1.amazonaws.com/DV/items/\(id)"
//        }
//
//
//
//        static func getAllClientStories(clientID id: String) -> String {
//            return "https://c1uujeigj3.execute-api.us-west-1.amazonaws.com/DV/items/\(id)"
//        }
//
//        static let allTasks = "https://grpzef83e6.execute-api.us-west-1.amazonaws.com/DV/tasks"
//        static func taskBy(taskID id: String) -> String {
//            return "https://grpzef83e6.execute-api.us-west-1.amazonaws.com/DV/tasks/\(id)"
//        }
//        static func taskBy(beaconID id: String) -> String {
//            return "https://grpzef83e6.execute-api.us-west-1.amazonaws.com/DV/tasks/beacon/\(id)"
//        }
//    }
//}
//
