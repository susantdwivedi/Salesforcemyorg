/*createComponentController.js*/
({
    doInit : function(cmp,event, helper) {
        $A.createComponents([
            ["lightning:button",
            {
                "aura:id": "findableAuraId",
                "label" : "Press Me",
                "onclick": cmp.getReference("c.handlePress")
            }]
        , ["ui:message",{
        "title" : "Sample Thrown Error",
        "severity" : "error",
    }],
    ["ui:outputText",{
        "value" : ""
    }]],
        function(components, status, errorMessage){
        if (status === "SUCCESS") {
            console.log("INside Sucess method");
            var Dynamicbutton = components[0];
            var message = components[1];
            var outputText = components[2];
            // set the body of the ui:message to be the ui:outputText
           // message.set("v.body", outputText);
            var body = cmp.get("v.body");
            body.push(Dynamicbutton);
            body.push(message);
            body.push(outputText);
            cmp.set("v.body", body);
        }
        else if (status === "INCOMPLETE") {
            console.log("No response from server or client is offline.")
            // Show offline error
        }
        else if (status === "ERROR") {
            console.log("Error: " + errorMessage);
            // Show error message
        }
    },
            function(newButton, status, errorMessage){
                //Add the new button to the body array
                if (status === "SUCCESS") {
                    var body = cmp.get("v.body");
                    body.push(newButton);
                    cmp.set("v.body", body);
                }
                else if (status === "INCOMPLETE") {
                    console.log("No response from server or client is offline.")
                    // Show offline error
                }
                else if (status === "ERROR") {
                    console.log("Error: " + errorMessage);
                    // Show error message
                }
            }
        );
    },

    handlePress : function(cmp) {
        console.log("button pressed");
    }
})