//
//  AppetizerDetailView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/26/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    var appetizerDetail: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        ZStack {
            LinearGradient(
                            colors: [.orange, .red],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .ignoresSafeArea()
            
            VStack {
//                AppetizerRemoteImage(urlString: appetizerDetail.imageURL)
                Image("asian-flank-steak")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 380)
                    .aspectRatio(contentMode: .fit)
                
                Text(appetizerDetail.name)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                
                Text(appetizerDetail.description)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                HStack {
                    AppetizerNutritionView(title: "Calories", content: appetizerDetail.calorie)
                    AppetizerNutritionView(title: "Carbs", content: appetizerDetail.carbs)
                    AppetizerNutritionView(title: "Protein", content: appetizerDetail.protein)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("$\(appetizerDetail.price, specifier: "%.2f") - Add To Order")
                        .foregroundColor(.white)
                        .frame(width: 250, height: 50)
                        .fontWeight(.bold)
                        .background(Color("brandPrimary"))
                        .cornerRadius(10)
                }
                .padding()

                Spacer()
                
            }
            .frame(width: UIScreen.main.bounds.width*0.8,height: 500)
            .background()
        }
    }
}

#Preview {
    AppetizerDetailView(appetizerDetail: MockData.sampleAppetizer, isShowingDetailView: .constant(false))
}

struct AppetizerNutritionView: View {
    let title: String
    let content: Int
    
    var body: some View {
        let suffix = title == "Calories" ? "" : " g"
            
        VStack {
            Text(title)
                .font(.system(size: 11))
                .padding(.bottom, 1)
            
            Text("\(content)\(suffix)")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
                .italic()
        }
        .padding()
    }
}
