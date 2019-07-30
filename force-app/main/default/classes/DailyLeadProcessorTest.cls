@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Opportunity records
        List<Lead> lstLead = new List<Lead>();
        
        for (Integer i=0; i<10; i++) {
            Lead l= new Lead(
                lastName = 'Lead Lastname ' + i,
                Company = 'Lead ComapnyName' + i
            );
            lstLead.add(l);
        }
        insert lstLead;
        
        // Get the IDs of the opportunities we just inserted
        Map<Id, Lead> LeadMap = new Map<Id, Lead>(lstLead);
        List<Id> leadIds = new List<Id>(LeadMap.keySet());
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP, 
            new DailyLeadProcessor());         
        // Verify the scheduled job has not run yet.
        
        // Stopping the test will run the job synchronously
        Test.stopTest();
        
        // Now that the scheduled job has executed,
        // check that our tasks were created
        
    }
}