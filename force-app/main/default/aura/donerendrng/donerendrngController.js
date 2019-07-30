({
  doneRendering: function(cmp, event, helper) {
    if(!cmp.get("v.isDoneRendering")){
      cmp.set("v.isDoneRendering", true);
      //do something after component is first rendered
    }
  }
})