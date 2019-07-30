/*eventBubblingGrandchildController.js*/
{
handleBubbling : function(component, event) {

console.log("Grandchild handler for " + event.getName());
    alert("Grandchild handler for " + event.getName());
}
}