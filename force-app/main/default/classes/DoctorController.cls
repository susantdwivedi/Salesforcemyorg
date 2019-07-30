/*
* This is used to insert data if new patient has arrived 
* if already patient was there then it insert invoice under it.
*/
public class DoctorController {
    
    //public wrapDoctorData objwrap {get;set;}
    
    @AuraEnabled
    public static string upsetInvoiceandPayment(String strWrapofDocData){
        wrapDoctorData objWrapData = (wrapDoctorData)JSON.deserialize(strWrapofDocData,wrapDoctorData.class);
        
        return '';
    }
    
    public Class wrapDoctorData{        
        @AuraEnabled public Doctor__c objDoc;
        @AuraEnabled public String strPatientName;        
        @AuraEnabled public String strMobileNumber;
        @AuraEnabled public Id strEmailAddress;
        @AuraEnabled public Decimal PaymentReceived;
        @AuraEnabled public String ReasonofVisit;        
    }
}