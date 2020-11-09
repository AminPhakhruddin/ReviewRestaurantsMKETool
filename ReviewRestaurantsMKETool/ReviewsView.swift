//
//  ReviewsView.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/7/20.
//

import SwiftUI

struct ReviewsView: View {
    @Environment(\.managedObjectContext) private var viewContext

    //Use Restaurant property
    //@State var restaurant: Restaurant
    var restaurantName: String
    @State var showReviewSheet = false
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    //@FetchRequest(entity: Restaurant.entity(), sortDescriptors: [], predicate: NSPredicate(format: "name" == %@", "KFC"))
    //var reviewsForRestaurant: FetchedResults<Restaurant>
    
    var reviewsRequest : FetchRequest<Restaurant>
    var restaurant: FetchedResults<Restaurant>{reviewsRequest.wrappedValue}
    
    init(predicate:String){
        self.restaurantName = predicate
        self.reviewsRequest = FetchRequest(entity: Restaurant.entity(), sortDescriptors: [], predicate:
            NSPredicate(format: "name == %@",predicate))
        //self.restaurant = reviewsForRestaurant[0]
    }

    
    var body: some View {
        //NavigationView{
        NavigationView {
            VStack {

                HStack{
                    VStack {
                        Image(systemName: "star.fill")
                            .padding()
                        Text(String(averageStars(reviewsArray: restaurant[0].reviewsArray)))
                    }
                    VStack(alignment: .leading) {
                        Text(restaurant[0].name!)
                            .font(.title)
                        Text(restaurant[0].type)
                            .font(.title)
                    }
                    Spacer()
                }
                .offset(y: -80)
                .padding(.bottom, -80)

                //Not safe
                List(restaurant[0].reviewsArray) { review in
                    VStack{
                        HStack{
                            VStack{
                                Image(systemName: "star.fill")
                                Text(String(review.numStars))
                                Spacer()
                            }
                            VStack(alignment: .leading) {
                                Text(self.dateFormatter.string(from: review.date))
                                Text(review.wrappedNotes)
                            }
                        }
                    }
                }
                .padding(.leading, -20)
                .padding(.trailing, -20)

            }
            Text("Hi")
        }
        .navigationBarTitle("Reviews", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            showReviewSheet = true
        }, label: {
            Image(systemName: "plus.circle")
                .imageScale(.large)
        }))
        .sheet(isPresented: $showReviewSheet) {
            ReviewSheet(restaurant: restaurant[0])
        }

    }
    
    private func averageStars(reviewsArray: [Review]) -> Double {
        if (reviewsArray.count == 0 ) { return 0 }
        
        var sum = 0
        for review in reviewsArray {
            sum += Int(review.numStars)
        }

        let roundedAvg = (Double(sum)/Double(reviewsArray.count) * 10).rounded()/10
        return roundedAvg
    }
}


/*
 Note: The following preview is currently commented out due to some issues with a prior implementation of the current SwiftUI view. The first implementation required @State var restaurant: Restaurant.
 
 In order for the preview to work correctly, it required a restaurant to be passed in. I wasn't able to find a good solution and implement in a short amount of time.
 
 That being said, with the current implementation, var restaurantName, the preview can edited to allow a preview of this view. 
 */


//struct ReviewsView_Previews: PreviewProvider {
//    //Use our persistant data as test data for the preview
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(entity: Restaurant.entity(), sortDescriptors: [])
//
//    //Note: need to make this data static since the preview is static
//    var restaurants: FetchedResults<Restaurant>
//
//    static var previews: some View {
//        ReviewsView(restaurant: ).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

