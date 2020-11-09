//
//  RestaurantSheet.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/7/20.
//

import SwiftUI

struct RestaurantSheet: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment (\.presentationMode) var presentationMode
    
    @FetchRequest(entity: Cuisine.entity(), sortDescriptors: [])
    var cuisines: FetchedResults<Cuisine>
    
    //Need to populate this array with data from CoreData
    //let restaurantTypes = ["Fast Food", "Casual Dining", "Fine Dining"]
    @State var selectedTypeIndex = 1
    @State var restaurantName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Type Details")) {
                    Picker(selection: $selectedTypeIndex, label: Text("Restaurant Type")) {
                        ForEach(0 ..< cuisines.count) {
                                //Text(self.restaurantTypes[$0]).tag($0)
                            Text(self.cuisines[$0].type ?? "General Cuisine")
                        }
                    }
                    
                }
                
                Section(header: Text("Name")) {
                    TextField("Restaurant Name", text: $restaurantName)
                        .keyboardType(.default)
                    
                }
                
                Button(action: {
                    print("Save the restaurant!")
                    //prevent adding a restaurant w/ a blank name
                    guard self.restaurantName != "" else {return}
                    let newRestaurant = Restaurant(context: viewContext)
                    newRestaurant.name = self.restaurantName
                    newRestaurant.type = self.cuisines[self.selectedTypeIndex].type ?? "General Cuisine"
                    
                    newRestaurant.id = UUID()
                    
                    //Save the created restaurant. If we fail, print the corresponding error
                    do{
                        try viewContext.save()
                        print("Restaurant saved.")
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print(error.localizedDescription)
                    }
                }) {
                    Text("Add Restaurant")
                }
            }
            .navigationTitle("Add Restaurant")
        }

    }
}

struct RestaurantSheet_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantSheet().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
