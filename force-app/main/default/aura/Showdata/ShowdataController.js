({
	myAction : function(component, event, helper) {
		
	}
    ,getNumbers : function(component, event, helper){
        var numbers = [];
        var j = component.get("v.MaximumLimit");
        console.log('j'+ j);
    	for (var i = 0; i <= j; i++) {
      	numbers.push({
        value: i
      	});
    	}
    	component.set("v.numbers", numbers); 
    	}
    }
})