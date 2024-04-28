//
//  ContentView.swift
//  Moonshot
//
//  Created by Alan Yanovich on 2023-12-19.
//

import SwiftUI

let columns = [
    GridItem(.adaptive(minimum: 150))
]

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
                    Group { // use a group to wrap your conditions in a view, otherwise they won't work, which you can then add modifiers to.
                        if showingGrid {
                            GridLayout(missions: missions, astronauts: astronauts) // if true, show the GridLayout view
                        } else {
                            ListLayout(missions: missions, astronauts: astronauts) // if false, show the ListLayout view
                        }
                        //ListLayout(missions: missions, astronauts: astronauts)
                    }
                    .toolbar {
                        Button {
                            showingGrid.toggle() // Toggles showingGrid to false or true
                        } label: {
                            if showingGrid {
                                Label("Show as table", systemImage: "list.dash")
                            } else {
                                Label("Show as grid", systemImage: "square.grid.2x2")
                            }
                        }
                    }
                    
                    .navigationTitle("Moonshot")
                    .background(.darkBackground) // sets the background color as specified in the Color-Theme.swift file
                    .preferredColorScheme(.dark) // sets the view to display as if the device is in Dark mode, even if it is not
                }
            }
        }


#Preview {
    ContentView()
}
