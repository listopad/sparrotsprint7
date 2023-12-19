//
//  ContentView.swift
//  sparrotsprint7
//
//  Created by Artem Dragunov on 17.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOpen = true
    @Namespace private var namespace
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            if isOpen {
                LargeButton()
            }
            else {
                SmallButton()
            }
        } 
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    
    func SmallButton()  -> some View {
        ZStack{
            Button(action: {
                withAnimation {
                    isOpen.toggle()
                }
            }, label: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.blue)
                    .matchedGeometryEffect(id: "background", in: namespace)
                    .frame(width: 100, height: 60)
                    .padding(12)
                    .overlay {
                        Text("Open")
                            .matchedGeometryEffect(id: "title",
                                                   in: namespace,
                                                   properties: .position, anchor: .leading)
                            .foregroundStyle(.white)
                    }
                
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .backgroundStyle(.red)
    }
    
    
    func LargeButton() -> some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.blue)
                .matchedGeometryEffect(id: "background", in: namespace)
                .frame(width: 300, height: 350)
            
            VStack {
                Button(action: {
                    withAnimation() {
                        isOpen.toggle()
                    }
                }, label: {
                    Group{
                        Text("\(Image(systemName: "arrowshape.backward.fill")) ") +
                        Text("Back")
                    }
                    .matchedGeometryEffect(id: "title", in: namespace, properties: .position, anchor: .leading)
                    .foregroundStyle(.white)
                    .padding(12)
                })
                
            }
        }
    }
}




#Preview {
    ContentView()
}
