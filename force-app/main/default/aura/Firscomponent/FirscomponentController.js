{
applyCSS: function(cmp, event) {
var cmpTarget = cmp.find('changeIt');
$A.util.addClass(cmpTarget, 'changeMe');
},
removeCSS: function(cmp, event) {
var cmpTarget = cmp.find('changeIt');
$A.util.removeClass(cmpTarget, 'changeMe');
},
mapClasses: function(arr, cssClass) {
for(var cmp in arr) {
$A.util.toggleClass(arr[cmp], cssClass);
}
}
    ,doinit: function(cmp,event){
        cmp.set("v.Setinitialval","This is Change in Value");
    }
    ,providediscount : function(cmp,event){
       var currencyinserted = cmp.get("v.myCurrency");
       var currencydiscount = cmp.get("v.num");
        alert('currencyinserted'+currencyinserted+' currencydiscount'+currencydiscount);
        cmp.set("v.valafterdisc",currencyinserted -((currencyinserted*currencydiscount)/100));
    }
    ,changetrue :function(cmp,event)
    {
        var currencytOrf = cmp.get("v.Checkboxname");
        alert('currencytOrf '+currencytOrf);
        if(currencytOrf == false){
            alert('currencytOrfINSIDE '+currencytOrf);
            cmp.set("v.Checkboxname",true);
            
        }
        else
        {
            cmp.set("v.Checkboxname",false);
        }
        }
    }
}