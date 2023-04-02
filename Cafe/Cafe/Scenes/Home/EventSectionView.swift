//
//  EventSectionView.swift
//  Cafe
//
//  Created by eun-ji on 2023/04/02.
//

import SwiftUI

struct EventSectionView: View {
    @Binding var events: [Event]
    var body: some View {
        VStack{
            HStack{
                Text("Events")
                    .font(.headline)
                Spacer()
                Button("See all"){}
                    .accentColor(.green)
                    .font(.subheadline)
            }
            .padding(16)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16){
                    ForEach(events) {event in
                        EventsSectionItemView(event: event)
                    }
                }
                .frame(maxWidth: .infinity, minHeight: 220, maxHeight: .infinity)
                .padding(.horizontal, 16)
            }
        }
    }
}

struct EventsSectionItemView: View{
    let event: Event

    var body: some View{
        VStack{
            event.image
                .resizable()
                .scaledToFill()
                .frame(height: 150)
                .clipped()
            Text(event.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            Text(event.description)
                .lineLimit(1)
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }.frame(width: UIScreen.main.bounds.width - 32)
    }
}

