({
	SaveEvent : function(component, event, helper) {
		 alert('hello');
	 var emp = component.get("v.Contact");
   
       //Calling the Apex Function
        var action = component.get("c.insertContact");
        //alert(action);
        //Setting the Apex Parameter
        action.setParams({
            objCon : emp
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            alert('state'+state);
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                //resetting the Values in the form
               var SavedAccount= a.getReturnValue();
               // component.set("v.ContactData", a.getReturnValue());
                alert('Record is Created Successfully');
           
           var compEvent = component.getEvent("SavingEvent");
           compEvent.setParams({"ContactData" : SavedAccount });
           compEvent.fire();
           alert("Event Fired");
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
 		//adds the server-side action to the queue        
        $A.enqueueAction(action);
	}
}
})