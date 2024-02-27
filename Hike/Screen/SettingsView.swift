//
//  SettingsView.swift
//  Hike
//
//  Created by Fuad Fadlila Surenggana on 18/02/24.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-Backpack"]
    
    var body: some View {
        List {
            // MARK: - SECTION: HEADER
            Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10, content: {
                        Text("HIKE")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    })
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8, content: {
                    Text("Where can you find \nperfect tracks? ")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                })
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            // MARK: - SECTION: ICONS
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12, content: {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button(action: {
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) { error in
                                    if error != nil {
                                        print("Failed request to upate app's icon: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Success! Your app's icon has been changed into \(alternateAppIcons[item])")
                                    }
                                }
                            }, label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            })
                            .buttonStyle(.borderless)
                        }
                    })
                }//: SCROLL VIEW
                .padding(.top, 12)
                
                Text("Choose your favorit app icon from the collection above.")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
                
            } header: {
                Text("Alternate Icons")
            }
            .listRowSeparator(.hidden )

            
            // MARK: - SECTION: ABOUT
            
            Section {
                //Labeled Content
                CustomListRowView(rowContent: "HIKE", rowColor: .blue, rowIcon: "apps.iphone", rowLabel: "Application")
                
                CustomListRowView(rowContent: "iOS, iPadOS", rowColor: .red, rowIcon: "info.circle", rowLabel: "Compatibility")
                
                CustomListRowView(rowContent: "Swift", rowColor: .orange, rowIcon: "swift", rowLabel: "Technology")
                
                CustomListRowView(rowContent: "1.0", rowColor: .purple, rowIcon: "gear", rowLabel: "Version")
                
                CustomListRowView(rowContent: "John Doe", rowColor: .mint, rowIcon: "ellipsis.curlybraces", rowLabel: "Developer")
                
                CustomListRowView(rowContent: "Robert Petras", rowColor: .pink, rowIcon: "paintpalette", rowLabel: "Designer")
                
                CustomListRowView(rowColor: .indigo, rowIcon: "globe", rowLabel: "Website", rowLinkContent: "Credo Academy", rowLinkDestination: "https://credo.academy")
                
            } header: {
                Text("ABOUT THE APP")
            } footer: {
                HStack {
                    Spacer()
                    Text("Copyright @ All right reserved.")
                    Spacer()
                }
                .padding(.vertical, 8)
            }

            
        }//: LIST
    }
}

#Preview {
    SettingsView()
}
