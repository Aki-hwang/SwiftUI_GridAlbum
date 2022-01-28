//
//  ContentView.swift
//  SwiftUI_GridAlbum
//
//  Created by Chuljin Hwang on 2022/01/28.
//

import SwiftUI

enum GridType: CaseIterable {  //CaseIterable를 하면 case를 배열화 foreach로 가져올 수 있어
    case single
    case double
    case triple
    case adative
    var columns: [GridItem]{
        switch self{
        case .single:
            return [GridItem(.flexible())]//맥스 민 안쓰면 화면에서 제일 크게 표현
        case .double:
            return [GridItem(.flexible()),
                    GridItem(.flexible())]
        case .triple:
            return [GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())]
        case .adative:
            return [GridItem(.adaptive(minimum: 80))]
        }
    }
}

struct ContentView: View {
    //그리드 타입에 따른 변수 설정
    var items = Item.dummyData
    @State private var selectedGridType : GridType = .single
    var body: some View {
        VStack{
            GridTypePicker(selectedGridType: $selectedGridType)
            ScrollView{
                LazyVGrid(columns: selectedGridType.columns) {
                    ForEach(items){ ii in
                        Image(ii.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
               
                .animation(.default) //lazy에 애니메이션 준다
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GridTypePicker: View {
    
    @Binding  var selectedGridType : GridType
    var body: some View {
        Picker("Grid Type", selection: $selectedGridType) {
            ForEach(GridType.allCases, id: \.self) { type in
                switch type {
                case .single:
                    Image(systemName: "rectangle.grid.1x2")
                case .double:
                    Image(systemName: "square.grid.2x2")
                case .triple:
                    Image(systemName: "square.grid.3x2")
                case .adative:
                    Image(systemName: "square.grid.4x3.fill")
                }
                
            }
        }
        .pickerStyle(SegmentedPickerStyle())//피커를 한줄로 나오게 만들어준다
    }
}
