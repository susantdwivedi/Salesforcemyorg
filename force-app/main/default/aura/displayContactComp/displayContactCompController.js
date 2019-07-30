/*account display controller */
({
 handleComponentEvent : function(component, event, helper) {
        alert('Event called for display 1');
        var objacc=event.getParam("ContactData");
        alert('Event called for display 2');
        //cmpEvent.fire();
        component.set("v.objCon",objacc);
        alert('Event called for display 3');
  
 }
})