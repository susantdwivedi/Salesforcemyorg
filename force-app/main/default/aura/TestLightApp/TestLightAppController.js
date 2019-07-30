({
    myAction : function(component, event, helper) {
        var action = component.get("c.getdisplayHello");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.displayHello", response.getReturnValue());
            }
        });
	 $A.enqueueAction(action);
    }   
})