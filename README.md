# ReviewRestaurantsMKETool
A trivial app for storing and viewing reviews of restaurants. This app was specifically designed to implement SwiftUI and Core Data.

## Content View
A SwiftUI view to see a list of restaurants to choose from. List is populated with data fetched from Core Database.

![Simulator Screen Shot - iPhone 12 - 2020-11-08 at 21 23 08](https://user-images.githubusercontent.com/39076409/98497281-27a35e00-2209-11eb-8dbb-c3257cdc023c.png)

## Add Restaurant View
A SwiftUI sheet to add a restaurant to the database. Restaurant is an entity, with attributes (type, name, id). Relationship to Reviews entity.

![Simulator Screen Shot - iPhone 12 - 2020-11-08 at 21 23 22](https://user-images.githubusercontent.com/39076409/98497283-27a35e00-2209-11eb-89a6-af658832f1e4.png)

## Add Restaurant View - Cuisine Picker
A SwiftUI picker populated with cuisines from the database. Cuisine is an entity with attributes (id, name)

![Simulator Screen Shot - iPhone 12 - 2020-11-08 at 21 23 30](https://user-images.githubusercontent.com/39076409/98497285-283bf480-2209-11eb-894a-d111d116a5b5.png)

## Reviews View
A SwiftUI view to see a list of reviews for the restaurant.

![Simulator Screen Shot - iPhone 12 - 2020-11-08 at 21 23 43](https://user-images.githubusercontent.com/39076409/98497286-283bf480-2209-11eb-9813-03ef205637c6.png)

## Add Reviews View
A SwiftUI sheet to add a review for the restaurant to the database. Review is an entity with attributes (rating, notes, date). Relationship to Restaurant entity.

![Simulator Screen Shot - iPhone 12 - 2020-11-08 at 21 23 58](https://user-images.githubusercontent.com/39076409/98497289-283bf480-2209-11eb-92e8-40a140c815bd.png)


## Future Updates
Some previews are currently commented out due to a previous implementation of the view. For the sake of time, I decided to comment out the previews so that the project could compile. Since previews are useful for development, I would try and reimplement the preview. Tests can be written to test the swift ui view state. 
