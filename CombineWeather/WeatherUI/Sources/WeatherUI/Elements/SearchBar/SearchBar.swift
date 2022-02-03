import SwiftUI

public struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    public init(text: Binding<String>) {
        self._text = text
        self.isEditing = false
    }
    
    public var body: some View {
        HStack {
            
            TextField("", text: $text)
                .placeholder(when: text.isEmpty) {
                    Text("Search...").foregroundColor(.gray)
                }
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color.white)
                .foregroundColor(.gray)
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
            
            
        }
    }
}
