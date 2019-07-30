({
	packItem : function(component, event, helper) {
        var packavl = component.get("v.item.Packed__c");
        component.set("v.item.Packed__c",true);
         var btnClicked = event.getSource();
        btnClicked.set("v.disabled",true);
		
	},
    
})