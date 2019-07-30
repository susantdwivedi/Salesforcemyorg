public class QuickactionSobjectOpen {
	@Auraenabled
    public static Opportunity createnewRecord(String objRecordId){
        List<Opportunity> lstOpprt = [SELECT id FROM Opportunity WHERE id =:objRecordId];
        
        return lstOpprt[0];
    } 
    
    @Auraenabled
    public static List<Opportunity> getAllOpport(){
        List<Opportunity> lstOpprt = [SELECT Name, Account.Name FROM Opportunity LIMIT 10];
        
        return lstOpprt;
    } 
}