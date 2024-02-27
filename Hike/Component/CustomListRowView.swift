//
//  CustomListRowView.swift
//  Hike
//
//  Created by Fuad Fadlila Surenggana on 18/02/24.
//

import SwiftUI

struct CustomListRowView: View {
    // MARK: - PROPERTIES
    
    @State var rowContent: String? = nil
    @State var rowColor: Color
    @State var rowIcon: String
    @State var rowLabel: String
    @State var rowLinkContent: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent {
            // Content
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                    .fontWeight(.heavy)
            } else if rowLinkContent != nil && rowLinkDestination != nil {
                Link(destination: URL(string: rowLinkDestination!)!, label: {
                    Text(rowLinkContent!)
                        .foregroundColor(.pink)
                        .fontWeight(.heavy)
                })
            } else {
                EmptyView()
            }
                
        } label: {
            // Label
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(rowContent: "John Doe", rowColor: .blue, rowIcon: "paintpalette", rowLabel: "Designer")
        CustomListRowView(rowColor: .pink, rowIcon: "globe", rowLabel: "Website", rowLinkContent: "Credo Academy", rowLinkDestination: "https://credo.academy")
    }
}
