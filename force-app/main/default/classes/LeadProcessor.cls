Global class LeadProcessor implements  Database.Batchable<sObject>, Database.Stateful {

 global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            [SELECT ID, LeadSource FROM Lead 
            WHERE LeadSource = 'Dreamforce']
        );
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        update scope;
        }
        
        global void finish(Database.BatchableContext bc){}
}