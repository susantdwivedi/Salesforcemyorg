({
	// Your renderer method overrides go here
    render : function(component,  helper) {
         alert("Hi Render");
		//component.set("v.ShowName","My Name is Sushant Dwivedi from Render");
        helper.setvaluefun(component, helper,"My Name is Sushant Dwivedi from Render");
        return this.superRender();
    },
    afterRender : function(component,  helper) {
         alert("Hi AfterRender");
		helper.setvaluefun(component, helper,"My Name is Sushant Dwivedi from after Rerender");
        //component.set("v.ShowName","My Name is Sushant Dwivedi from after Render");
        return this.superAfterRender();
         alert("Hi After Render Called");
    },
    rerender : function(component, helper) {
         alert("Hi Re-Render");
		helper.setvaluefun(component, helper,"My Name is Sushant Dwivedi from reerender");
        //component.set("v.ShowName","My Name is Sushant Dwivedi from after Render");
        return this.superRerender();
         alert("Hi After RE-Render Called");
    }
})