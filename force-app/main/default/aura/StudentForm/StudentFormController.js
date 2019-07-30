({
	savedata : function(component, event, helper) {
        console.log('inside click create contact');
        var isemptyrowfound = false;
		var action = component.get("c.getStudentdata");
			// Set save configuration parameters.
		var sNamesField = component.find("studname");
        var sNames = sNamesField.get("v.value");
        if (sNames == null || sNames == '') {
            // Set error
            sNamesField.set("v.errors", [{message:"Please fill the Student name" }]);
            return false;
        	} else {
            // Clear error
            sNamesField.set("v.errors", null);
        }
        var SFathernameField = component.find("studfname");
        var SFathername = SFathernameField.get("v.value");
         if (SFathername == null || SFathername == '') {
            // Set error
            SFathernameField.set("v.errors", [{message:"Please fill the father name" }]);
            //return false;
        } else {
            // Clear error
            SFathernameField.set("v.errors", null);
        }
        var SrollNumberField = component.find("rollno");
        var SrollNumber = SrollNumberField.get("v.value");
         if (SrollNumber == null || SrollNumber == '') {
            // Set error
            SrollNumberField.set("v.errors", [{message:"Please fill the roll number" }]);
           // return false;
        } else {
            // Clear error
            SrollNumberField.set("v.errors", null);
        }
        var TypeofStudentrField = component.find("TypeofStu");
        var TypeofStudent = TypeofStudentrField.get("v.value");
         if (TypeofStudent == null || TypeofStudent == '') {
            // Set error
            TypeofStudentrField.set("v.errors", [{message:"Please Select the type of student" }]);
           // return false;
        } else {
            // Clear error
            TypeofStudentrField.set("v.errors", null);
        }
        var studMobilenuField = component.find("Mobilenu");
        var studMobilenuStudent = studMobilenuField.get("v.value");
         if (studMobilenuStudent == null || studMobilenuStudent == '') {
            // Set error
            studMobilenuField.set("v.errors", [{message:"Please fill the mobile Number" }]);
            //return false;
        } else {
            // Clear error
            studMobilenuField.set("v.errors", null);
        }
        var skoolnameField = component.find("skoolname");
        var skoolnameStudent = skoolnameField.get("v.value");
         if (skoolnameStudent == null || skoolnameStudent == '') {
            // Set error
            skoolnameField.set("v.errors", [{message:"Please fill the school name" }]);
            //return false;
        } else {
            // Clear error
            skoolnameField.set("v.errors", null);
        }
        
        var sStandardField = component.find("sStandard");
        var sStandardStudent = sStandardField.get("v.value");
         if (sStandardStudent == null || sStandardStudent == '') {
            // Set error
            sStandardField.set("v.errors", [{message:"Please fill the student class" }]);
            //return false;
        } else {
            // Clear error
            sStandardField.set("v.errors", null);
        }
        
        var sStandardBirthdate = component.find("sStandarddate");
        var sStandardBirthdateval = sStandardBirthdate.get("v.value");
        console.log('=====sStandardBirthdateval===='+sStandardBirthdateval);
         if (sStandardBirthdateval == null || sStandardBirthdateval == '') {
            // Set error
            console.log('=====sStandardBirthdateval===='+sStandardBirthdateval);
            sStandardBirthdate.set("v.errors", [{message:"Please fill the student class" }]);
            //return false;
        } else {
            // Clear error
            sStandardBirthdate.set("v.errors", null);
        }
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
            "sStandrd":sStandardStudent,
            "birthdate":sStandardBirthdateval
             
         });
		console.log('After click create contact');
          action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.StudentEnterDetails", response.getReturnValue());
                var toastEvent = $A.get("e.force:showToast");
                        toastEvent.setParams({                        
                        "title" : 'Success Message',
                        "message": "Sucessfully inserted the record",
                        "messageTemplate": "Mode is pester ,duration is 5sec and Message is overrriden",
                        "key": "info_alt",
                        "type": "success",
                        "duration" :"5000",
                        "mode": "pester"
                        });
                        toastEvent.fire();
            }
             else if(state === "ERROR"){
                  var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title" : "Error Message",
                        "message": response.getError(),
                        "messageTemplate": 'Mode is pester ,duration is 5sec and Message is overrriden',
                       "duration" :'5000',
                        "key": "info_alt",
                        "type": "error",
                        "mode": 'pester'
                    });
                    toastEvent.fire();
              }
              $A.get("e.force:refreshView").fire();
           	  $A.get("e.force:closeQuickAction").fire();
        });
	 $A.enqueueAction(action);
        
	},
    EventCall : function(component,event,helper)
    {
        var appEvent = $A.get("e.c:StudentApplicationEvent");
        appEvent.setParams({
            "message" : "An application event fired me. " 
            });
        appEvent.fire();
    }
})