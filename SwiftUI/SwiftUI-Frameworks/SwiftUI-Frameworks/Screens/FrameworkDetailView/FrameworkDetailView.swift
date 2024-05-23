//
//  FrameworkDetailView.swift
//  SwiftUI-Frameworks
//
//  Created by Gerard on 4/4/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @State var isShowingSafariView = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            AFButton(isShowingSafariView: $isShowingSafariView, title: "Learn More")
                .padding()
        }
        .fullScreenCover(isPresented: $isShowingSafariView) {
            SafariView(url: (URL(string: framework.urlString) ?? URL(string: "apple.com"))!)
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}
