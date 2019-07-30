({
	addSumEvent : function(component, event, helper) {
		var num1 = component.get("v.numberONE");
        var num2 = component.get("v.numberTWO");
        alert('num1  '+num1+' num2 '+num1);
        var one  = component.find("childId");
        one.addMethod(num1,num2);
        
	}
})