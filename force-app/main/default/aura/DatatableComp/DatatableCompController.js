({
	doInit : function(component, event, helper) {
		var action = component.get("c.getAllOpport"); 
        component.set('v.testColumns', [
            {
                 label: 'Opportunity Name',
                      fieldName: 'Name',
                      type: 'String',
                      typeAttributes: {
                     label: { fieldName: 'Name' }
                      }
                },
           {
                 label: 'Account Name',
                      fieldName: 'Account.Name',
                      type: 'Account',
                      typeAttributes: {
                     label: { fieldName: 'Account.Name' }
                      }
                } 
        ]);
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.lstOpprt", response.getReturnValue());
                		/*var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({                        
                        "title" : 'Success Message',
                        "message": "Sucessfully inserted the record",
                        "messageTemplate": "Mode is pester ,duration is 5sec and Message is overrriden",
                        "key": "info_alt",
                        "type": "success",
                        "duration" :"5000",
                        "mode": "pester"
                        });
                        toastEvent.fire();*/
            }
             else if(state === "ERROR"){
                  /*var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title" : "Error Message",
                        "message": response.getError(),
                        "messageTemplate": 'Mode is pester ,duration is 5sec and Message is overrriden',
                       "duration" :'5000',
                        "key": "info_alt",
                        "type": "error",
                        "mode": 'pester'
                    });
                    toastEvent.fire();*/
              }
        });
	 $A.enqueueAction(action);
	}
})