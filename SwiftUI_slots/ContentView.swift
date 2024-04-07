//
//  ContentView.swift
//  SwiftUI_slots
//
//  Created by Sahil on 07/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var symbols = ["apple","cherry","star"]
    @State var nums = Array(repeating: 0, count: 9)
    @State private var creds = 1000
    @State private var backgrounds =  Array(repeating: Color.white, count: 9)
    private var betAmount = 5
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(red: 188/255, green: 108/255, blue: 37/255))
                .ignoresSafeArea()
            
            Rectangle()
                .rotationEffect(.degrees(45))
                .foregroundColor(Color(red: 221/255, green: 161/255, blue: 94/255))
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                HStack{
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots")
                        .bold()
                        .foregroundColor(Color(red: 40/255, green: 54/255, blue: 24/255))
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .scaleEffect(2)
                Spacer()
                Text("Credits: \(creds)")
                    .font(.subheadline)
                    .padding()
                    .background(Color.white)
                    .opacity(0.8)
                    .cornerRadius(30)
                Spacer()
                VStack{
                    HStack{
                        Spacer()
                        cardView(label: $symbols[nums[0]],cardbackground: $backgrounds[0])
                        cardView(label: $symbols[nums[1]],cardbackground: $backgrounds[1])
                        cardView(label: $symbols[nums[2]],cardbackground: $backgrounds[2])
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        cardView(label: $symbols[nums[3]],cardbackground: $backgrounds[3])
                        cardView(label: $symbols[nums[4]],cardbackground: $backgrounds[4])
                        cardView(label: $symbols[nums[5]],cardbackground: $backgrounds[5])
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        cardView(label: $symbols[nums[6]],cardbackground: $backgrounds[6])
                        cardView(label: $symbols[nums[7]],cardbackground: $backgrounds[7])
                        cardView(label: $symbols[nums[8]],cardbackground: $backgrounds[8])
                        Spacer()
                    }
                }
                Spacer()
                HStack(spacing: 20){
                    VStack{
                        Button{
                           Processbutton()
                        }label: {
                            Text("Spin")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal,20)
                                .background(Color.red)
                                .cornerRadius(20)
                        }
                        Text("\(betAmount) Credits")
                            .font(.subheadline)
                    }
                    
                    VStack{
                        Button{
                            Processbutton(true)
                        }label: {
                            Text("Max Spin")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding()
                                .padding(.horizontal,20)
                                .background(Color.red)
                                .cornerRadius(20)
                        }
                        Text("\(betAmount*5) Credits")
                            .font(.subheadline)
                    }
                }
                Spacer()
            }
        }
    }
    func Processbutton( _ isMax : Bool = false){
        // changing backgrounds to white
        backgrounds = backgrounds.map{_ in Color.white}
        
        if(!isMax){
            //changing symbols
            nums[3] = Int.random(in: 0...symbols.count-1)
            nums[4] = Int.random(in: 0...symbols.count-1)
            nums[5] = Int.random(in: 0...symbols.count-1)
        }
        else{
            // changing symbols
            nums = nums.map{
                _ in Int.random(in: 0...symbols.count-1)
            }
        }
        
        Processwinning(isMax)
    }
    
    func Processwinning(_ isMax: Bool = false){
        
        var matches = 0
        
        if(!isMax){
            //check winnings
            matches += Procesmatches(3, 4, 5)
        }
        else {
            //1st row horizontal winning
            matches += Procesmatches(0, 1, 2)
            // 2nd row horizontal winning
            matches += Procesmatches(3, 4, 5)
            // 3rd row horizontal winning
            matches += Procesmatches(6, 7, 8)
            // left diagonal winning
            matches += Procesmatches(0, 4, 8)
            // right diagonal winning
            matches += Procesmatches(2, 4, 6)
        }
        
        if(!isMax){
            if matches > 0{
                creds += betAmount * 2
            }else{
                creds -= betAmount
            }
        }else{
            if matches > 0{
                creds += betAmount * 10
            }else{
                creds -= betAmount * 5
            }
        }
    }
    
    func Procesmatches(_ index1:Int, _ index2:Int , _ index3:Int)-> Int{
        if(nums[index1]==nums[index2] && nums[index2]==nums[index3]){
            backgrounds[index1] = Color.green
            backgrounds[index2] = Color.green
            backgrounds[index3] = Color.green
            return 1
        }
        return 0
    }
}

#Preview {
    ContentView()
}
