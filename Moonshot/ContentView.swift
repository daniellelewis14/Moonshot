//
//  ContentView.swift
//  Moonshot
//
//  Created by Danielle Lewis on 7/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showList = false
        
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    
    var body: some View {
        NavigationView {
            Group {
                if showList {
                    ListView()
                } else {
                    GridView()
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .scrollContentBackground(.hidden)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        showList.toggle()
                    } label: {
                        Image(systemName: showList ? "square.grid.2x2" : "list.bullet")
                            .resizable()
                            .scaledToFit()
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
