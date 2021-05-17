//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Alicia Windsor on 16/05/2021.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment (\.editMode) var editMode //keys off environment's edit mode
    @EnvironmentObject var modelData: ModelData // pass comntrol of model data to progile host
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            HStack{
                if editMode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = modelData.profile
                                     editMode?.animation().wrappedValue = .inactive
                    }
                        .foregroundColor(.red)
                }
                Spacer()
                EditButton() //controls edit mode
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
             }
             .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
