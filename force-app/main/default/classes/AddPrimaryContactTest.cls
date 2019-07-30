@isTest
public class AddPrimaryContactTest {
    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        // add a parent account
        accounts.add(new Account(name='Parent'));
        // add 100 child accounts
        for (Integer i = 0; i < 100; i++) {
            if(i< 50)
                accounts.add(new Account(
                name='Test Account'+i,BillingState ='NY'
            ));
            else
             accounts.add(new Account(
                name='Test Account'+i,BillingState='CA'
            ));
        }
        insert accounts;
        Contact objCon = new Contact();
        objCon.LastName = 'Test Account';
        objCon.AccountId = accounts[0].Id;
        insert objCon;
        
    }
    
    static testmethod void testQueueable() {
        // query for test data to pass to queueable class
        //Id parentId = [select id from account where name = 'Parent'][0].Id;
        List<Contact> accounts = [select id, name from Contact where name like 'Test Account%'];
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(accounts[0], 'NY');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        //System.assertEquals(100, [select count() from account where parentId = :parentId]);
    }
    
}