//
//  SortingAlertView.swift
//  Movies
//
//  Created by Alexandru Jdanov on 06.11.2022.
//

import SwiftUI

struct SortingAlertView: View {
    
    @Binding private (set) var isShowing: Bool
    
    let buttons: [SortingAlertButton]
    var backgroundColor: Color = Color.black
    var contentPadding: CGFloat = 0
    var contentCornerRadius: CGFloat = 12
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                backgroundColorView()
                let expectedWidth = geometry.size.width * 0.92
                VStack {
                    Spacer()
                    buttonsPad()
                        .background(Color.background)
                        .cornerRadius(contentCornerRadius)
                    VStack {
                        Color.clear
                    }.frame(height: 5)
                    cancelButton()
                        .background(Color.background)
                        .cornerRadius(contentCornerRadius)
                    Spacer()
                        .frame(height: 20)
                }
                .background(Color.clear)
                .shadow(radius: 1)
                .opacity(self.isShowing ? 1 : 0)
                .frame(
                    minWidth: expectedWidth,
                    maxWidth: expectedWidth
                )
                .background(Color.clear)
                .animation(.easeInOut)
                
            }
            .edgesIgnoringSafeArea(.all)
            .zIndex(Double.greatestFiniteMagnitude)
        }
    }
    private func backgroundColorView() -> some View {
        backgroundColor
            .edgesIgnoringSafeArea(.all)
            .opacity(self.isShowing ? 0.4 : 0)
    }
    private func buttonsPad() -> some View {
        VStack {
            ForEach(0..<buttons.count, id:\.self) {
                Divider()
                    .padding([.leading, .trailing], -contentPadding)
                let current = buttons[$0]
                Button(action: {
                    current.action()
                    withAnimation {
                        self.isShowing.toggle()
                    }
                }, label: {
                    current.content.frame(height: 30)
                })
            }
        }
        .padding([.bottom], 12)
        
    }
    
    private func cancelButton() -> some View {
        VStack {
            Divider()
                .padding([.leading, .trailing], -contentPadding)
                .background(Color.clear)
            Button(action: {
                withAnimation {
                    self.isShowing.toggle()
                }
            }, label: {
                Text("Cancel")
                    .foregroundColor(.black)
                    .font(Font.event.bold14)
                    .frame(height: 40)
            })
        }
    }
}
