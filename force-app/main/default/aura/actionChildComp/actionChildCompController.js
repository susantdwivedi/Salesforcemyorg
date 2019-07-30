({
	addNumber : function(component, event, helper) {
	  var params = event.getParam('arguments');
       // if (params) {
            var param1 = params.numberONE;
            var param2 = params.numberTWO;
            alert('param1  '+param1+' param2 '+param2);
            // add your code here
            var param3 = param1+param2;
            component.set("v.numberfirst", param1);
            component.set("v.numbersecond", param2);
			component.set("v.total", param3);

            

       // }
    
	}
})