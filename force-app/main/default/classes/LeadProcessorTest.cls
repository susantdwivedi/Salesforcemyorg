@isTest
private class LeadProcessorTest{
    
     @testSetup 
        static void setup() { 
        List<Lead> lstlead = new List<Lead>();
            for( integer i=0;i<200;i++){
                Lead objLead = new Lead();
                objLead.lastName = 'Testlaed'+i;
                objLead.LeadSource='Dreamforce';
                objLead.Company = 'salesforce';
                lstlead.add(objLead);
                }
            insert lstlead;
        }
    
    private TestMethod static void method1(){
        Test.startTest();
        LeadProcessor onjLP = new LeadProcessor();
        Database.executeBatch(onjLP);
        Test.stopTest();
    }
}