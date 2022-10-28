# gimmenow_assignment

Gimmenow assignment project.

## Getting Started

This project is a assignment from Gimmenow.

# Guidelines

- Username/password: vuthephong1203@gmail.com/12345678 (or you can register new account with email) this is use AWS Amplify Authenticator
- Forgot password will sent otp to email
- After login succes, app will load current location and add user marker. App also render 2 customer marker and 2 polygon base on data.json (convert to data.dart). Click on any customer marker will show button navigate, click on this will open navigating flow with direction and estimate time and distance.
- When current location changing the user marker will update it's position on the map and send data about updated location to AWS Amplify
- The geoFence feature not working yet. Not sure why but maybe invalid data since geojson work well with .geojson file

# Used package
- AWS Amplify packages (for Amplify feature)
- Getx (for state management)
- flutter_map (for display MapBox)
- latlong2 (for map data)
- geojson (for geoFence)
- flutter_mapbox_navigation (for map navigation with MapBox)


https://user-images.githubusercontent.com/32532646/198702361-6650e940-e809-4058-a722-daf2b5d51ab3.mp4

