//
//  MissionView.swift
//  Moonshot
//
//  Created by Alan Yanovich on 2023-12-19.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    
    var body: some View {
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.top)
                    Text("Launch Date: \(mission.formattedLaunchDate)")
                        .lineLimit(2)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
        
                    VStack(alignment: .leading) {
                        RectDivider()
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)

                        Text(mission.description)
                        RectDivider()
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    MissionAstrScrollView(crew: crew)
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
        let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

        return MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
}
