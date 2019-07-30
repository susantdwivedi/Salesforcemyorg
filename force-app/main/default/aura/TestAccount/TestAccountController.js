({
	doInit : function(component, event, helper) {
		var action = component.get("c.getAccountData");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var response = response.getReturnValue();
                if (!$A.util.isUndefinedOrNull(response)) {
                    component.set("v.lstadata", response);
                    console.log(JSON.stringify(response));
                }
            }
        });
        $A.enqueueAction(action);
	},
    Closethemodal : function(component, event, helper){
        //var vardata = event.getParam("vardata");
        var vardata = event.target.id; 
        alert('====vardata==='+vardata)
    }
    
})