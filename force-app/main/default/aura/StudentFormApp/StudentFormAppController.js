({
	savedata : function(component, event, helper) {
        console.log('inside click create contact');
		var action = component.get("c.getStudentdata");
			// Set save configuration parameters.
		var sNamesField = component.find("studname");
        var sNames = sNamesField.get("v.value");
        var SFathernameField = component.find("studfname");
        var SFathername = SFathernameField.get("v.value");
        var SrollNumberField = component.find("rollno");
        var SrollNumber = SrollNumberField.get("v.value");
        var TypeofStudentrField = component.find("TypeofStu");
        var TypeofStudent = TypeofStudentrField.get("v.value");
        var studMobilenuField = component.find("Mobilenu");
        var studMobilenuStudent = studMobilenuField.get("v.value");
        var skoolnameField = component.find("skoolname");
        var skoolnameStudent = skoolnameField.get("v.value");
        var sStandardField = component.find("sStandard");
        var sStandardStudent = sStandardField.get("v.value");
        console.log("Create Contact: " + sNames);
        console.log("Create Contact: " + SFathername);
        console.log("Create Contact: " + SrollNumber);
        console.log("Create Contact: " + studMobilenuStudent);
        console.log("Create Contact: " + skoolnameStudent);
        console.log("Create Contact: " + sStandardStudent);
        action.setParams({
             "sName" : sNames,
                "rollNo": SrollNumber,
             "sFatName" : SFathername,
            "TypeofSt":TypeofStudent,
            "sMobno":studMobilenuStudent,
            "sSkoolName":skoolnameStudent,
            "sStandrd":sStandardStudent
             
         });
console.log('After click create contact');
          action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.StudentEnterDetails", response.getReturnValue());
                alert("Sucess");
            }
        });
	 $A.enqueueAction(action);
        alert("Sucess");
	}
})