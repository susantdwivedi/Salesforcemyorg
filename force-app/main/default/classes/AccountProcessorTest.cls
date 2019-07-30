@isTest
private class AccountProcessorTest{
	
    private TestMethod static void method1(){
        Test.startTest();
        Account objAcc = new Account();
        objAcc.Name = 'TestAccount';
        insert objAcc ;
        List<String> lstStr = new List<String>();
        lstStr .add(objAcc.Id);
        AccountProcessor.countContacts(lstStr );
         Test.stopTest();
    }
   
}