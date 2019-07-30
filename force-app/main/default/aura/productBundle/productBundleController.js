({
 searchProduct : function(component, event, helper) 
    {
     var Search=component.get("v.SearchString");
        //alert("searchProduct method called with :" +Search);
        var action = component.get("c.fetchProductBundle");
  action.setParams({"strProdName":Search});
        
        action.setCallback(this, function(response) 
        {
   
            var state = response.getState();
            //alert('===state==='+state);
            if (state === "SUCCESS") {
                component.set('v.lstProductBundle', response.getReturnValue());
                component.set('v.isExist', true);
                //alert("lstProductBundle filled");
       
       }
  });
  $A.enqueueAction(action);  
 },
    saveProduct : function(component, event, helper) 
    {
         alert('===saveProduct called===');
    },
    CalculateListPrice : function(component, event, helper) 
    {
        alert('===CalculateListPrice called===');
        var checkCmp = component.find("Childcheckbox");

    },
    saveProduct : function(component, event, helper)
    {
        alert("=======Alert In Save Section");
    }
    
})