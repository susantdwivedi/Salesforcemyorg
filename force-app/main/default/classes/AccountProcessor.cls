public class AccountProcessor{
 @future
 public static void countContacts(List<String> lstofacc){
     List<account> lstAcc = new List<Account>();
     for(Account objAcc: [SELECT Id ,(SELECT Id FROM Contacts) FROM Account WHERE Id IN : lstofacc]){
         if(objAcc.Contacts != null){
             Account objnewAcc = new Account(Number_Of_Contacts__c = objAcc.Contacts.Size(), Id =objAcc.Id  );
             lstAcc.add(objnewAcc );
         }
     }
     if(lstAcc.size() > 0)
         update lstAcc;
 }
}