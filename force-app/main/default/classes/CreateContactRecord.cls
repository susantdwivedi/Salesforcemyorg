public class CreateContactRecord {

   
    @AuraEnabled
    public static list<contact> createRecord (Contact cnt){
        
        try{
            System.debug('CreateContactRecord::createRecord::contact'+cnt);
            
            if(cnt != null){
                insert cnt;
            }
            
        } catch (Exception ex){
            
        }
        list<Contact> lstcon = [SELECT Id, Name, Email FROM Contact ];
        return lstcon;
    } 
    @AuraEnabled
    public static list<contact> showallcontact(String accountId, Decimal annualRevenue) {
        list<Contact> lstcon = [SELECT Id, Name, Email FROM Contact ];
        

        // Perform isAccessible() and isUpdateable() checks here 
        return lstcon;
    }
}