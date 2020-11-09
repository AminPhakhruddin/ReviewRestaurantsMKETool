//
//  ContentView.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/4/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: Restaurant.entity(), sortDescriptors: [])
    var restaurants: FetchedResults<Restaurant>
    
    @FetchRequest(entity: Cuisine.entity(), sortDescriptors: [])
    var cuisines: FetchedResults<Cuisine>
    
    
    @State var editMode: Bool = false


    @State var showRestaurantSheet = false
    var body: some View {
        NavigationView {
            List{
                VStack(alignment: .leading){
                    Text("Sort by")
                    HStack{
                        Button(action: {
                            print("Order by rating")
                        }) {
                            Text("Avg Rating")
                        }
                        Divider()
                        Button(action: {
                            print("Order by name")
                        }) {
                            Text("Name")
                        }
                        Divider()
                        Button(action: {
                            print("Order by recent")
                        }) {
                            Text("Most Recent Review")
                        }
                    }
                }
                //Text("Sample Restaurant")
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: ReviewsView(predicate: restaurant.name ?? "KFC")) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(restaurant.name!)")
                                    .font(.headline)
                                Text("\(restaurant.type)")
                                    .font(.subheadline)
                            }
                            .onTapGesture {
                                //future: if editMode is true present new edit restaurant view
                                    print("Row tapped")
                                
                                //Present new editRestaurantView
                                //Send selected row's restaurant data to new edit restaurant view to prepopulate fields
                                //In editRestaurantView update the core data entity

                            }
                            
                            Spacer()
                            Button(action: {print("Add review")}) {
                                Text( "\(restaurant.reviewsArray.count) reviews")
                                    .foregroundColor(.blue)
                            }
                        }
                        .frame(height: 50)
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        viewContext.delete(restaurants[index])
                    }
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Foodie")
            .navigationBarItems(leading: EditButton(), trailing: Button (action: {
                showRestaurantSheet = true
            }, label: {
                Image(systemName: "plus.circle")
                    .imageScale(.large)
            }))
            .sheet(isPresented: $showRestaurantSheet) {
                RestaurantSheet()
            }
            .onAppear(perform: loadData)

        }
    }
    
    private func loadData() {
      if cuisines.count == 0 {
        // run code to initialize cuisine types if there are no types loaded available
        let restaurantTypes = ["Fast Food", "Casual Dining", "Fine Dining", "BBQ"]
        for type in restaurantTypes {
            let newCuisine = Cuisine(context: viewContext)
            newCuisine.id = UUID()
            newCuisine.type = type
        }
      }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}



