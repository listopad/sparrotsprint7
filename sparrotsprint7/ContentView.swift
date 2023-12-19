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
               // LargeButton()
                TestLargeButton()
            }
            else {
                //SmallButton()
                TestSmallButton()
            }
        }
        
    }
    
    func TestSmallButton() -> some View {
        Button(action: {
            withAnimation {
                isOpen.toggle()
            }
        }, label: {
            Label("Open", systemImage: "arrowshape.backward.fill")
                .matchedGeometryEffect(id: "title", in: namespace)

        })
        .buttonStyle(.borderedProminent)
        .matchedGeometryEffect(id: "background", in: namespace)
    }
    
    func TestLargeButton() -> some View {
        ZStack {
            Label("Close", systemImage: "")
                .matchedGeometryEffect(id: "title", in: namespace)

        }
        .onTapGesture {
            withAnimation {
                isOpen.toggle()
            }
        }
        .frame(width: 300, height: 400, alignment: .topLeading)
        .background(Color.blue)
        .matchedGeometryEffect(id: "background", in: namespace)
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
                .matchedGeometryEffect(id: "title", in: namespace)
        })
        .buttonStyle(.borderedProminent)
        .matchedGeometryEffect(id: "background", in: namespace)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    }
    
    
    func LargeButton() -> some View {
        VStack (alignment: .leading)  {
            Label("Close", systemImage: "arrowshape.backward.fill")
                .font(.title)
                .padding()
                .matchedGeometryEffect(id: "title", in: namespace)
                .onTapGesture {
                    withAnimation {
                        isOpen.toggle()
                    }
                }
        }
        .frame(width: 300, height: 400, alignment: .topLeading)
        .background(.blue)
        .matchedGeometryEffect(id: "background", in: namespace)
        .cornerRadius(14)
        .foregroundStyle(.white)
    }
    
}




#Preview {
    ContentView()
}
