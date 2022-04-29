//
//  ContentView.swift
//  Hello Combine
//
//  Created by Jay Bergonia on 4/30/22.
//

import SwiftUI
import Combine

class SampleViewModel: ObservableObject {
    @Published var myText: String = ""
    @Published var myMessage: String = ""
    
    init() {
        $myText
            .map {$0.isEmpty ? "❌" : "\($0) ✅" }
            .assign(to: &$myMessage)
    }
}

struct ContentView: View {
    @StateObject var model: SampleViewModel = SampleViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter some text", text: $model.myText)
                .border(Color.blue)
            
            Text("Hello world in Combine x SwiftUI x MVVM!")
                .padding()
            
            Text("Your text goes here: \(model.myMessage)")
                .padding()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
