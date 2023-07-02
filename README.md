# OTT Hub App

OTT Hub is a Flutter application that serves as a central hub for accessing various over-the-top (OTT) platforms. It provides users with a seamless browsing experience, allowing them to search the web, browse trending shows, and access different OTT platforms all within the app.

## Features

- **Web View Integration**
  - Seamlessly integrates a web view using the Flutter InAppWebView package.
  - Allows users to load web pages from different OTT platforms directly within the app.

- **OTT Platforms**
  - Includes a comprehensive collection of OTT platforms.
  - Each platform is represented by an OTTPlatform object containing information such as name, logo URI, and default web link.
  - Users can browse and select their desired platform for content consumption.

- **Trending Shows**
  - Showcases a set of trendingShows representing popular shows across different platforms.
  - Allows users to explore and directly access trending shows within the app.

- **Web View Control**
  - Provides essential control functionalities for the web view.
  - Manages the state and functionality of the web view using the WebViewController class.
  - Enables navigation backward and forward, page reloading, and interaction with loaded web pages.
  - Utilizes the InAppWebViewController instance to control the web view and interact with web pages.
  - Tracks canGoBack and canGoForward boolean variables for navigation history.
  - Offers goBack, goForward, and reload methods for controlling web view navigation.

- **Visibility Function**
  - Implements a visibility function to track the visibility of web pages within the app.
  - The visibility of a web page is determined based on user interaction and scrolling behavior.

- **Search Functionality**
  - Implements a search bar using the TextField widget.
  - Manages search queries and specific web addresses using the searchController, a TextEditingController.
  - Allows users to search and load corresponding web pages within the app.

- **Snackbars**
  - Utilizes SnackBar widgets for displaying brief notifications or alerts to the user.
  - Shows messages such as page load failures or search query results.

- **Drawer Navigation**
  - Incorporates a Drawer widget for creating a side navigation drawer.
  - Customizable to include links and additional functionality.
  - Provides a convenient way for users to access different sections or pages within the app.

- **Connectivity Check**
  - Can be implemented using Flutter packages like connectivity_plus.
  - Monitors the device's network connectivity status.
  - Handles offline or weak network connection scenarios.
  - Provides appropriate UI feedback to inform users about network status and prompt them to connect to a stable network.

## Dependencies

To enable the above features, the app relies on the following Flutter dependencies:

- carousel_slider: ^4.0.0
- connectivity_plus: ^3.1.0
- dots_indicator: ^3.0.0
- flutter_inappwebview: ^5.3.2
- provider: ^6.0.1

Please ensure that you include the correct versions of these dependencies in your pubspec.yaml file.

## Getting Started

To get started with the OTT Hub app, follow these steps:

1. Clone the repository: `git clone https://github.com/your-username/ott-hub-app.git`
2. Navigate to the project directory: `cd ott-hub-app`
3. Install the Flutter dependencies: `flutter pub get`
4. Run the app on a connected device or emulator: `flutter run`

## Conclusion

- OTT Hub app serves as a central hub for accessing various OTT platforms.
- Users can search the web, browse trending shows, and access different OTT platforms within the app.
- The app seamlessly integrates web view functionality for loading web pages from OTT platforms.
- Users can explore and select their preferred OTT platforms from a collection of options.
- Trending shows across platforms are showcased for easy discovery and access.
- Web view control features enable navigation, page reloading, and interaction with loaded web pages.
- The search functionality allows users to perform web searches or enter specific web addresses.
- Snackbars provide brief notifications or alerts for effective communication with users.
- Drawer navigation can be implemented to provide additional functionality and links.
- Incorporating connectivity check ensures the app can handle network connectivity scenarios.
- Dependencies such as carousel_slider, connectivity_plus, dots_indicator, flutter_inappwebview, and provider enhance the app's features and performance.

The OTT Hub app provides users with a seamless and convenient experience for accessing and enjoying content from various OTT platforms. By centralizing access and providing essential features, the app simplifies the browsing and consumption of OTT content.

Please feel free to customize and expand this conclusion as needed for your specific app.


## Screenshot 

![Screenshot_2023-07-02-19-08-23-72_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/9bee6921-9215-47da-a256-bf6e5ae273b7)

![Screenshot_2023-07-02-19-22-15-02_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/97081bc0-4dd7-4158-a05c-ea2764b5b492)

![Screenshot_2023-07-02-19-22-19-83_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/07c1c78f-a509-4bfe-8a45-9d78172710c1)

![Screenshot_2023-07-02-19-08-56-38_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/95c948f0-3fa9-4bc8-9664-2f7524e42166)

![Screenshot_2023-07-02-19-09-24-11_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/d4e8b010-5c64-4d7c-8427-ce2092e7547b)

![Screenshot_2023-07-02-19-09-43-10_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/246f9d34-6211-4f59-a9bb-f1e5e50aaf38)

![Screenshot_2023-07-02-19-10-28-85_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/c6ce37a1-f83c-4339-87bc-ba4191f5442b)

![Screenshot_2023-07-02-19-10-46-61_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/e6e943c3-a35b-444c-92a4-d74ac149b565)

![Screenshot_2023-07-02-19-11-02-05_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/5b9593af-e52f-4448-842f-c23c1ee70a1a)

![Screenshot_2023-07-02-19-11-30-31_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/62e7cfb6-5cca-45d0-9315-ca169b8e72af)

![Screenshot_2023-07-02-19-11-11-94_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/c43add3e-5b1c-4032-b1eb-e77064160702)

![Screenshot_2023-07-02-19-11-38-97_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/12338646-9a64-4740-a634-35b87ac20861)

![Screenshot_2023-07-02-19-14-13-23_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/9cf6f62b-8de6-4adb-afdc-55f75021a432)

![Screenshot_2023-07-02-19-22-06-92_a70b7e03b05f21a77cabb0a224503010](https://github.com/tushal13/OTTHub/assets/113960162/59f2082f-353e-46ad-a0e7-9d7ca34e0faf)

## Contact

For any inquiries or further information, please contact .....

Contact Information

If you have any questions or need assistance with the OTT Hub app, feel free to reach out to me at tushalgopani003@gmail.com.

Happy coding!
