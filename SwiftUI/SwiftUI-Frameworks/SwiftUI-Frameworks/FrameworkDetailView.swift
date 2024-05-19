//
//  FrameworkDetailView.swift
//  SwiftUI-Frameworks
//
//  Created by Gerard on 4/4/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
            }
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            AFButton(title: "Learn More")
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.sampleFramework)
        .preferredColorScheme(.dark)
}
