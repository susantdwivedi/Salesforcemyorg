({
	handleClick : function(component, event, helper) {
        
        alert('hello');
	 var emp = JSON.stringify(component.get("v.ContactWrap"));
   
       //Calling the Apex Function
        var action = component.get("c.insertContact");
        //alert(action);
        //Setting the Apex Parameter
        action.setParams({
            JsonStringWrapOBj : emp
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
               
                component.set("v.ContactWrap", a.getReturnValue());
                alert('Record is Created Successfully');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
 		//adds the server-side action to the queue        
        $A.enqueueAction(action);
	},
    
    doInit: function(component, event, helper) {
        alert('Jai');
      helper.getContactListToShow(component);
     }
})