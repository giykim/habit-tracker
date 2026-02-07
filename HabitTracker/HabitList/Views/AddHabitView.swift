//
//  AddHabitView.swift
//  HabitTracker
//
//  Created by Giyoung Kim on 2/4/26.
//

import SwiftUI

struct AddHabitView: View {
    @StateObject var viewModel = AddHabitViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
            // Emoji picker
            TextField("⚽", text: $viewModel.emoji.max(1))
                .frame(width: 65)
                .font(.system(size: 60))
                .padding(.top, 30)
            
            // Title
            TextField("Title", text: $viewModel.title.max(25))
                .font(.title)
                .fontWeight(.bold)
            
            // Description
            TextField("Description", text: $viewModel.description.max(70), axis: .vertical)
                .font(.title2)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            
            // Error Text
            if(!viewModel.error.isEmpty) {
                Text(viewModel.error)
                    .foregroundStyle(.red)
            }
            
            // Add Button
            Button(
                action: {
                    if(viewModel.addNewHabit()) {
                        presentationMode.wrappedValue.dismiss()
                    }
                },
                label: {
                    Text("Add")
                        .foregroundStyle(.white)
                        .padding()
                        .fontWeight(.bold)
                        .background(.orange)
                        .cornerRadius(10)
                }
            )
            
            Spacer()
            // - Want to Save, Erase Data and Dismiss the Sheet
        }
        .padding()
    }
}

extension Binding where Value == String {
    func max(_ limit: Int) -> Self {
        if self.wrappedValue.count > limit {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(limit))
            }
        }
        return self
    }
}

#Preview {
    AddHabitView()
}
