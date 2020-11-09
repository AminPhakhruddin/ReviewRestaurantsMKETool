//
//  ReviewSheet.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/7/20.
//

import SwiftUI

struct ReviewSheet: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    var restaurant: Restaurant
    
    @State var reviewNotes = ""
    let starTypes = ["1 Star - Never again!", "2 Stars - Bad service!", "3 Stars - It's doable", "4 Stars - Good Food & Service", "5 Stars - Telling my friends!"]
    @State var selectedTypeIndex = 4
    @State var selectedDate = Date()


    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Restaurant Rating")) {
                    Picker(selection: $selectedTypeIndex, label: Text("1 to 5 Star Rating")) {
                        ForEach(0 ..< starTypes.count) {
                                Text(self.starTypes[$0]).tag($0)
                        }
                    }
                    
                }
                
                Section(header: Text("Notes")) {
                    TextField("Feedback/comments/suggestions", text: $reviewNotes)
                        .keyboardType(.default)
                    
                }
                
                Section(header: Text("Review Date")) {
                    VStack {
                        DatePicker("When did you eat here?", selection: $selectedDate, displayedComponents: .date)
                        //Text("Your selected date: \(selectedDate)")
                    }.padding()
                }
                
                Button(action: {
                    print("Save the restaurant!")
                    //prevent adding a restaurant w/ a blank name
                    guard self.reviewNotes != "" else {return}
                    let newReview = Review(context: viewContext)
                    newReview.notes = self.reviewNotes
                    newReview.numStars = Int16(self.selectedTypeIndex) + 1
                    newReview.id = UUID()
                    newReview.date = self.selectedDate

                    newReview.restaurant = self.restaurant
                    
                    
                    
                    //Save the created review. If we fail, print the corresponding error
                    do{
                        try viewContext.save()
                        print("Review saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add Review")
                }
            }
                .navigationTitle("Add Review")
        }
    }
}

//struct ReviewSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewSheet()
//    }
//}
