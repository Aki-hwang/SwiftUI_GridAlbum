//
//  SingleLow.swift
//  SwiftUI_GridAlbum
//
//  Created by Chuljin Hwang on 2022/01/29.
//

import Foundation
import SwiftUI

struct SingleRow: View{
    
    let item : Item
    var body: some View{
        
        ZStack{
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            VStack{
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text(item.mainTitle)
                            .font(.headline)
                            .lineLimit(1)
                        Text(item.subTitle)
                            .font(.subheadline)
                            .lineLimit(1)
                    }
                    Spacer()
                }
                .padding(10)
                .background(Color.white.opacity(0.5))
                
            }
            
        }   .animation(.default)
    }
}


struct SingleRow_Previews: PreviewProvider{
    static var previews: some View{
        SingleRow(item: Item(mainTitle: "main", subTitle: "sub", imageName: "freeBG1"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/350.0/*@END_MENU_TOKEN@*/)) //아이템을 받아오니까 초기 값이 없거든 그래서 Item안에 있는 모든 것에 대한 초기 값을 잡아준다
    }
}
