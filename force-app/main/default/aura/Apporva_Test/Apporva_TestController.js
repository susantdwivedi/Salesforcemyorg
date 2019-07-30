({
	Closethemodal : function(component, event, helper) {
        alert('hii');
		var modal = component.find("exampleModal");
        $A.util.addClass(modal, 'hideDiv');
        alert('hii');
	}
})