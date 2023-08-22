//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Muhammad Fahmi on 22/08/23.
//

import SwiftUI

var helloDarmstadt = Text("Hello, Darmstadt") // View as properties

var helloWorldView: some View { // View as computed properties
    Group { // can be VStack but group If you don’t specifically want to organize them in a stack
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundColor(.accentColor)
        Text("Hello, Jakarta!")
            .foregroundColor(.green) // override. Priority: child first
        Text("Hello, Makassar!")
        Text("Hello, Sorong!")
        helloDarmstadt
    }
    .foregroundStyle(.red) // Environtment modifiers, it modify VStacks, all the View inside, Text() above, rather than modify them one by one inside VStacks
    //    .blur(radius: 5) // is regular modifiet, see the documenation
}

@ViewBuilder var myName: some View{ // same as above but prever to use this in best practice
    Group{
        Text("Muhammad Fahmi")
    }
}

struct codingLang: View { // view composition
    let skill = ["Python", "Swift", "AferEffects", "Figma"]
    let whosSkill: String
    
    var body: some View{
        Group{
            Text("\(whosSkill)'s Skill: ")
            HStack{
                ForEach(skill, id: \.self) {
                    Text("\($0)")
                }
            }
        }
    }
}

struct BesarkanTitle: ViewModifier { // // make custom modifier, call must with modifier(struckname())
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View { // make custom modifier, call with just "." without modifier(struckname())
    func besarkanStyle() -> some View {
        modifier(BesarkanTitle())
    }
}

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.black, .pink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Spacer()
                helloWorldView
                helloWorldView
                Spacer()
                myName
                    .besarkanStyle() // custom modifier
                Spacer()
                codingLang(whosSkill: "Fahmi") //custom view
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
