({
	getContactListToShow : function(component) {
        var action = component.get("c.FungetObjectStruncture");
        alert('Hello');
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS"){
                    component.set("v.ContactWrap", response.getReturnValue());    // set the return value in the component attribute 
             }
            });
        $A.enqueueAction(action);
    }
})