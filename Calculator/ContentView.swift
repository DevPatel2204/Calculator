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
        ZStack {
            Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                // Text View
                Text(displayText)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                
                CalcButtons(buttons:["7","8","9","/"], action: buttonTap(_:))
                CalcButtons(buttons:["4","5","6","*"], action: buttonTap(_:))
                CalcButtons(buttons:["1","2","3","-"], action: buttonTap(_:))
                CalcButtons(buttons:["0",".","=","+"], action: buttonTap(_:))
                CalcButtons(buttons:["C"], action: {button in clearbutton()})
                    
            }
        }
    }
    
    func buttonTap(_ button:String) {
        switch button {
        case "+","-","*","/":
            currentOperator = button
            storedValue = Double(currentInput)
            currentInput = ""
        case "=":
            if let operatorType = currentOperator,
               let storedValue = storedValue,
               let currentValue = Double(currentInput){
                let result:Double
                
                switch operatorType{
                case "+":
                    result = storedValue + currentValue
                case "-":
                    result = storedValue - currentValue
                case "*":
                    result = storedValue * currentValue
                case "/":
                    result = storedValue / currentValue
                default:
                    fatalError("Unknown Operator")
                }
                currentInput = "\(result)"
                currentOperator = nil
            }
        case ".":
            currentInput += button
        default:
            currentInput += button
        }
        if currentInput.isEmpty
        {
            displayText = "0"
        }else{
            displayText = currentInput
        }
    }
    func clearbutton(){
        currentInput = ""
        storedValue = nil
        currentOperator = nil
        displayText = "0"
    }
        
}
struct CalcButtons : View {
    
    let buttons:[String]
    let action:(String)->Void
    let buttonSize = (UIScreen.main.bounds.width - 5 * 12) / 4
    
    var body: some View{
        
        HStack(spacing: 12){
            ForEach(buttons, id:\.self){buttonLabel in
                Button{
                    action(buttonLabel)
                }
                    label: {
                    Text(buttonLabel)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .frame(width:buttonSize,height: buttonSize)
                            .background(.orange)
                            .foregroundColor(.white)
                            .cornerRadius(50.0)
                            
                }}
        }
        
    }
}


#Preview {
    ContentView()
}
