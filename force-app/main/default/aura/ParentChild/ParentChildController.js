({
	create : function(component, event, helper) {
		console.log('Create record');
                //getting the contact information
        var contact = component.get("v.contact");
       
      
        
       
        //Calling the Apex Function
        var action = component.get("c.createRecord");
                //Setting the Apex Parameter
        action.setParams({
            cnt : contact
        });
        
        //Setting the Callback
        action.setCallback(this,function(a){
            //get the response state
            var state = a.getState();
            
            //check if result is successfull
            if(state == "SUCCESS"){
                //Reset Form
                var newContact = {'sobjectType': 'Contact',
                                    'FirstName': '',
                                    'LastName': '',
                                    'Email': ''
                                   };
                //resetting the Values in the form
                component.set("v.contact",newContact);
                component.set("v.Contacts", a.getReturnValue());
                alert('Record is Created Successfully');
            } else if(state == "ERROR"){
                alert('Error in calling server side action');
            }
        });
        
		//adds the server-side action to the queue        
        $A.enqueueAction(action);

	}
    ,getCon: function(cmp){
        var action = cmp.get("c.showallcontact");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                cmp.set("v.Contacts", response.getReturnValue());
            }
        });
	 $A.enqueueAction(action);
    }
})