public class InsertContactController1 {
   
    
    @AuraEnabled
    public static Contact insertContact(Contact objCon)
    {
       
        try{
            insert objCon;
        }
        catch(Exception e){
        }
        list<Contact> lstcon =[SELECT id, FirstName, lastName, Phone, Email FROM Contact];
        return objCon;
    }

}