using Toybox.WatchUi as Ui;
using Toybox.System;
using Toybox.Lang;
using Toybox.Graphics;

class GarminJSONWebRequestWidgetView extends Ui.View {
		
    	var _userId;
    	var _Id;
    	var _title;
    
    function initialize(userId, Id, title) {
        View.initialize();
        
        //Handle the JSON data and parse to String if needed
        _userId = userId.toString();   
        _Id = Id.toString();
        _title = title;
        //System.println(_title);        
        }

    // Load your resources here
    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        //Set JSON data as text to watch screen at the location we would like
        View.findDrawableById("high").setText(_Id);
        View.findDrawableById("low").setText(_userId);
        View.findDrawableById("center").setText(_title);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
    
}
