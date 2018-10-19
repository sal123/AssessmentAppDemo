# AssignmentApp

#Getting Started
-----------
### Its a simple application in which app fetch data from api and display a list of data in tableview
    - Showing loading-indicator

    -Use WebView in detail screen

### I have used NYTime API.  API need header  API Key which you get from NYTimes and need two parameters section and timePeriod. Detail Could be seen in MostViewService in HomeviewController-> Services->

### I have used Alamofire for network calls and used Network Manager to handle all networks calls in the app. 

### Structural I made service class and service class finally gives call to network manager with parameters headers url and urlRequestType.

### I have made our own  Model Mapper which dynamically map Json object with our Model. Mapper is written in Utility Class.

 


# Pods Used

. Alamofire

. SwiftyJSON

. AlamofireImage

################


![simulator screen shot - iphone xr - 2018-10-19 at 11 41 01](https://user-images.githubusercontent.com/4111847/47202428-82ee2380-d396-11e8-8bfa-3cf9da336881.png)


![simulator screen shot - iphone xr - 2018-10-19 at 11 41 03](https://user-images.githubusercontent.com/4111847/47202458-96998a00-d396-11e8-904f-edaba7769ac1.png)

![simulator screen shot - iphone xr - 2018-10-19 at 11 41 09](https://user-images.githubusercontent.com/4111847/47202460-96998a00-d396-11e8-8c88-d1f6d18c0f4b.png)



