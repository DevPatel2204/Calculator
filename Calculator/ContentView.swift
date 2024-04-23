//
//  ContentView.swift
//  Calculator
//
//  Created by Dev Patel on 23/04/24.
//

import SwiftUI


struct ContentView: View {
    @State private var displayText = "0"
    @State private var currentInput = ""
    @State private var storedValue :Double? = 0
    @State private var currentOperator:String?
    var body: some View {
        VStack{
            
            // Text View
            Text(displayText)
                .font(.system(size: 60))
            
            CalcButtons(buttons:["1","2","3","4"])
            CalcButtons(buttons:["1","2","3","4"])
            CalcButtons(buttons:["1","2","3","4"])
            CalcButtons(buttons:["1","2","3","4"])
        }
    }
        
}
struct CalcButtons : View {
    
    let buttons:[String]
    //let action:(String)->Void
    let buttonSize = (UIScreen.main.bounds.width - 5 * 12) / 4
    
    var body: some View{
        
        HStack(spacing: 12){
            ForEach(buttons, id:\.self){buttonLabel in
                Button{
                    // action: (buttonLabel),
                }
                    label: {
                    Text(buttonLabel)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(width:buttonSize,height: buttonSize)
                            .background(.gray)
                            .foregroundColor(.white)
                            .cornerRadius(50.0)
                }}
        }
        
    }
}


#Preview {
    ContentView()
}
