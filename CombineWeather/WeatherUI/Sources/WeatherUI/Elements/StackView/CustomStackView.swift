//
//  CustomView.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 12.11.2021.
//

import SwiftUI

@available(iOS 15.0, *)
public struct CustomStackView<Title: View, Content: View> : View {
    var titleView: Title
    var contentView: Content
    
    public init(@ViewBuilder titleView: @escaping ()-> Title, @ViewBuilder contentView: @escaping ()-> Content) {
        self.contentView = contentView()
        self.titleView = titleView()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            titleView
                .font(.callout)
                .lineLimit(1)
                .frame(height: 38)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(.ultraThinMaterial, in: CustomCorner(corner: [.topLeft, .topRight], radius: 12))
            
            VStack{
                
                Divider()
                
                contentView
                    .padding()
            }
            .background(.ultraThinMaterial, in: CustomCorner(corner: [.bottomLeft, .bottomRight ], radius: 12))
        }
        .colorScheme(.dark)
    }
}
