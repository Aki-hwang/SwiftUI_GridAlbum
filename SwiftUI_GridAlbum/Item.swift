//
//  Item.swift
//  SwiftUI_GridAlbum
//
//  Created by Chuljin Hwang on 2022/01/28.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let mainTitle : String
    let subTitle: String
    let imageName : String
    
    static var dummyData : [Item]{ //static 경우 인스턴스 만들지 않고 쓸수 있어
        
        (0...30).map{ index in //map을 쓰면 편하게 만들 수 있어
            Item(mainTitle: "Main title Index \(index)",
                 subTitle: "Sub title Index \(index)",
                 imageName: "freeBG\(index % 3 + 1)")
        }
        
        
//        var temp = [Item]{}
//
//        for index in 0...30 {
//            temp.append(
//            Item(mainTitle: "Main title Index \(index)",
//                 subTitle: "Sub title Index \(index)",
//                 imageName: "freeBG\(index % 3 + 1)")
//            )
//        }
//        return
    }
}
