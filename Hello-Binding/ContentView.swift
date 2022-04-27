//
//  ContentView.swift
//  Hello-Binding
//
//  Created by Dominik Woźniak on 06/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    var model = Dish.all()
    @State private var isSpicy = false
    var body: some View {
       
        List{
            
            Toggle(isOn: $isSpicy) {
                Text("Spicy")
                    .font(.title)
            }
            
            
            ForEach(model.filter{ $0.isSpicy == self.isSpicy}) {dish in
                
                HStack {
                    Image(dish.imageURL)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(dish.name)
                        .font(.title)
                        .lineLimit(nil)
                    
                    if(dish.isSpicy){
                    
                    Image("spicy-ikon")
                        .resizable()
                        .frame(width: 35, height: 35)
                    }
                }
            }
            
        }
        
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
