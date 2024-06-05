//
//  ObservableTest.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 6/5/24.
//

import SwiftUI
import Observation

// using Observable
@Observable class UserObservable {
    var name: String = ""
    var jobTitle: String = ""
    var followersCount: Int = 0
    
    init(name: String, jobTitle: String, followersCount: Int) {
        self.name = name
        self.jobTitle = jobTitle
        self.followersCount = followersCount
    }
}

// using ObservableObject
class UserObservableObject : ObservableObject {
    @Published var name: String
    @Published var jobTitle: String
    @Published var followersCount: Int
    
    init(name: String, jobTitle: String, followersCount: Int) {
        self.name = name
        self.jobTitle = jobTitle
        self.followersCount = followersCount
    }
}

struct ObservableTest: View {
    
    // ObservableObject
    @StateObject var userTest = UserObservableObject(name: "Gerard Apinado",
                                 jobTitle: "iOS Developer",
                                 followersCount: 99)
    // @Observable
    var observedUser = UserObservable(name: "Gerard N. Apinado",
                                      jobTitle: "iOS Developer",
                                      followersCount: 99)
    
    var body: some View {
        Text(observedUser.name)
            .font(.title)
            .fontWeight(.bold)
        
        Text(observedUser.jobTitle)
            .foregroundStyle(.secondary)
        
        Text("\(observedUser.followersCount) Followers")
            .foregroundStyle(.secondary)
        
        Button {
            observedUser.followersCount += 1
        } label: {
            Text("Add Follower")
        }
        .padding()
        .buttonStyle(.bordered)
        .tint(.blue)
        .controlSize(.large)
    }
}

#Preview {
    ObservableTest()
}
