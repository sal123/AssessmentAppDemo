# AssignmentApp

#Getting Started
-----------
# Its a simple application in which app fetch data from api and display a list of data in tableview
    - Showing loading-indicator

    -Use WebView in detail screen

# I have used NYTime API.  API need header  API Key which you get from NYTimes and need two parameters section and timePeriod. Detail Could be seen in MostViewService in HomeviewController-> Services->

# I have used Alamofire for network calls and used Network Manager to handle all networks calls in the app. 

# Structural I made service class and service class finally gives call to network manager with parameters headers url and urlRequestType.

# I have made our own  Model Mapper which dynamically map Json object with our Model. Mapper is written in Utility Class.

 


# Pods Used

. Alamofire

. SwiftyJSON

. AlamofireImage

################


