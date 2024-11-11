# BUS VIEW: Rob Wilson
## Functionality
On the Trip view, the user can:
- See the departure and arrival times for the next bus on the queried journey.
- See the seat availability for future journeys.
- See the stops along that route, excluding those that are before or after the queried journey.
- See the current bus position and orientation for a quiried journey.
- Tap to refresh data about current quote and trip information.
- Tap on each stop along the route to see arrival/departure times as appropriate for the presented trip.
- Tap to "Previous" or "Next" to easily find details about other trips for the queried journey that day

## Architecture
- Given the limited feature scope of the project, the app uses a very basic MVVM architecture. View state is managed by the view model, which uses a class conforming to RouteServicing to fetch quote and trip information asyncronously. Using dependency injection this way makes it easy to test the view model for many outcomes by simply injecting a mock conformance to the service protocol.

## Post MVP
- With more time, I would have considered a caching strategy, by introducing a Repository layer between the view model and service. This would also have abstracted additional data processing, such as trip trimming, from the view model.
- Further features e.g. a stop focussed overlay giving the opportunity to receive a notification when the bus is nearing the stop and a purchase button present on the map view if the active quote is still bookable.

## Notes
- The basic data models were created using an online parsing tool called quicktype, for speed of development. As such, they include several properties which are unnecessary fot the limited app functionality, which would be removed for a production application.
- The tests aren't comprehensive, but are indicitive of the types of unit tests that would be valuable to test both data processing and user interactions.
