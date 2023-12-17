//
//  ContentView.swift
//  sparrotsprint7
//
//  Created by Artem Dragunov on 17.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isOpen = true
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
            Text("Open")
                .font(.title)
                .padding()
        })
        .buttonStyle(.borderedProminent)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
    
    
    func LargeButton() -> some View {
        VStack (alignment: .leading)  {
            Label("Close", systemImage: "arrowshape.backward.fill")
                .font(.title)
                .padding()
                .onTapGesture {
                    withAnimation {
                        isOpen.toggle()
                    }
                }
        }
        .frame(width: 300, height: 400, alignment: .topLeading)
        .background(.blue)
        .cornerRadius(14)
        .foregroundStyle(.white)
    }
    
}




#Preview {
    ContentView()
}
