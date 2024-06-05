//
//  AppetizerDetailView.swift
//  SwiftUI-Appetizers
//
//  Created by Gerard on 5/26/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    var appetizerDetail: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
            VStack {
                AppetizerRemoteImage(urlString: appetizerDetail.imageURL)

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
                    AppetizerNutritionView(title: "Calories", content: appetizerDetail.calories)
                    AppetizerNutritionView(title: "Carbs", content: appetizerDetail.carbs)
                    AppetizerNutritionView(title: "Protein", content: appetizerDetail.protein)
                }
                
                Spacer()
                
                Button {
                    order.add(appetizerDetail)
                    isShowingDetailView = false
                } label: {
//                    APButton(title: "$\(appetizerDetail.price) - Add To Order")
                    Text("$\(appetizerDetail.price) - Add To Order")
                }
                .modifier(StandardButtonStyle())
                .standardButtonStyle()
//                .buttonStyle(.bordered)
//                .tint(Color("brandPrimary"))
//                .controlSize(.large)
                .padding()

                Spacer()
                
            }
            .frame(width: 320,height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(
                Button {
                isShowingDetailView = false
                } label: {
                    XDismissButton()
                }
            ,alignment: .topTrailing)
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
                .fontWeight(.semibold)
                
        }
        .padding()
    }
}
