//
//  SearchBar.swift
//  CombineWeather
//
//  Created by Егор Евсеенко on 23.11.2021.
//
import SwiftUI
import MapKit

public struct SearchBarView: View{
    @State var searchText = ""
    public var body: some View {
        NavigationView {
            ZStack{
                GeometryReader{ proxy in
                    Image("backgroundSky")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: proxy.size.width, height: proxy.size.height)
                    
                }
                .ignoresSafeArea(.all)
                .blur(radius: 35)
                VStack{
                    SearchBar(text: $searchText)
                        .padding(.top, 10)
                    Spacer()
                    
                    Button(action:{
                        
                    }) {
                        Text("Show Details")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.bottom, 20)
                }
            }
            .navigationBarTitle(Text("Search city"))
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}


extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}
