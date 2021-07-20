using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Communications;

//The URL of JSON source
const URL = "https://jsonplaceholder.typicode.com/todos/2";

class GarminJSONWebRequestWidgetApp extends App.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    	//Call the web request at start up to get the JSON data
        makeRequest();
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	//Initial text presented on watch screen before loading data
        return [ new GarminJSONWebRequestWidgetView("Loading data","","") ];
    }


   // set up the response callback function
   function onReceive(responseCode, data) {
       //Ui.switchToView(new GarminJSONWebRequestWidgetView("onReceive: " + URL + "\n" + responseCode + " " + data), null, Ui.SLIDE_IMMEDIATE);
       
       //Get only the JSON data we are interested in and call the view class
       Ui.switchToView(new GarminJSONWebRequestWidgetView(data.get("userId"),data.get("id"),data.get("title")), null, Ui.SLIDE_IMMEDIATE);
   }

   function makeRequest() {
       var url = URL;
       var params = null;
       var options = {
         :method => Communications.HTTP_REQUEST_METHOD_GET,
         :responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
       };
       var responseCallback = method(:onReceive);

       Communications.makeWebRequest(url, params, options, method(:onReceive));
  }

}
