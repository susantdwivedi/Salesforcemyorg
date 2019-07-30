global class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> lstLead = [SELECT Id, LeadSource  
            FROM Lead 
            WHERE LeadSource = ''];
            for(Lead objLead : lstLead ){
                objLead.LeadSource ='Dreamforce';
            }
        // Create a task for each opportunity in the list
        update lstLead ;
        
        
        DailyLeadProcessor reminder = new DailyLeadProcessor();
        // Seconds Minutes Hours Day_of_month Month Day_of_week optional_year
        String sch = '20 30 8 10 2 ?';
        String jobID = System.schedule('Remind Opp Owners', sch, reminder);
    }
    
}