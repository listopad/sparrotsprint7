//
//  ContentView.swift
//  sparrotsprint7
//
//  Created by Artem Dragunov on 17.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOpen = true
    
    @Namespace var namespace
    var body: some View {
        ZStack{
            
            if isOpen {
                LargeButton()
            }
            else {
                SmallButton()
            }
        }
        
    }
    
    
    func SmallButton()  -> some View {
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
                        Text("Close")
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
