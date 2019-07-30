public class getobjectdata {

    @AuraEnabled 
    public static List<Account> getAccountData(){
        return [SELECT Name, Industry,Phone  FROM Account];
    }
}