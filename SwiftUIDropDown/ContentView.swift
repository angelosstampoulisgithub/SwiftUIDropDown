//
//  ContentView.swift
//  SwiftUIDropDown
//
//  Created by Angelos Staboulis on 21/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @FocusState private var isFocused: Bool
    @State var isOpen:Bool
    var body: some View {
        ZStack{
            VStack{
                Text("SwiftUI Simple DropDown")
            }.frame(maxWidth: 360,maxHeight: 5,alignment: .topLeading)
        }
        VStack {
            TextField("text", text: $text)
                .onChange(of: text, { oldValue, newValue in
                    if newValue.count == 0{
                        isOpen.toggle()
                    }
                    
                })
                .padding(.all)
                .focused($isFocused)
                .border(.black)
                .overlay(alignment: .bottom) {
                    ZStack {
                        if isFocused {
                            overlayResults()
                        }
                    }
                    .alignmentGuide(.bottom) { $0[.top] }
                }
                .zIndex(1)
                .padding(.all)
        }
    }
    func overlayResults() -> some View {
        @State var items = ["George","Tasos","Angelos","Stelios","Angeliki","Kostas","Nikos","Theodoros","Angeletos","Nikoleta","Antonis","Theofanis"]
        
        return ZStack {
            VStack{
                ForEach(items,id:\.self){item in
                    if item.contains(text){
                        Divider()
                        VStack{
                            Text(item)
                        }.frame(height:65)
                        .onTapGesture {
                                text=item
                                isOpen.toggle()
                                
                        }
                    }
                }
            }.background(Color.white)
            .border(Color.black, width: 1)
            .opacity(isOpen ? 0 : 1)
            .frame(width:370)
        }
        
    }
}

#Preview {
    ContentView(isOpen: false)
}
