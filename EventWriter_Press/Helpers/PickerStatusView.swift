//
//  TypeCoachPickerView.swift
//  CorrectLifestyle
//
//  Created by Роман on 02.07.2024.
//

import SwiftUI

struct PickerStatusView: View {
    var hint: String
    var maxWidth: CGFloat = 250
    var cornerRadius: CGFloat = 15
    @Binding var selection: String
    @State private var showOptions = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Text(selection == "" ? hint : selection)
                        .foregroundStyle(selection == "" ? .gray : .white)
                        .lineLimit(1)
                    Spacer()
                    
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.white)
                        .rotationEffect(.init(degrees: showOptions ? -100 : 0))
                    
                }
                .padding(.horizontal, 15)
                .frame(width: size.width, height: size.height)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        showOptions.toggle()
                    }
                }
                if showOptions {Optionsview().padding(.top)}
            }
            .background {
                Color.main
                    .cornerRadius(18)
            }
            
        }.frame(width: maxWidth, height: 67)
        
    }
    
    @ViewBuilder
    func Optionsview() -> some View {
        HStack{
            ForEach(StatusEnum.allCases, id: \.self) { status in
                HStack(spacing: 0) {
                    Text(status.rawValue)
                        .foregroundStyle(.white)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "checkmark")
                        .foregroundStyle(.white)
                        .opacity(selection == status.rawValue ? 1: 0)
                }
                .foregroundStyle(selection == status.rawValue ? Color.white : Color.gray)
                .animation(.none, value: selection)
                .frame(height: 32)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.snappy) {
                        selection = status.rawValue
                        showOptions = false
                    }
                }
            }
            
        }
        .padding(.horizontal, 15)
        
    }
}

#Preview {
    PickerStatusView(hint: "enter", selection: .constant(""))
}
