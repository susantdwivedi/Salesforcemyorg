public class AddPrimaryContact implements Queueable {
    
    private Contact contactsdata;
    private String Statename;
    
    public AddPrimaryContact (Contact objCon, String State ) {
        this.contactsdata = objCon;
        this.Statename = State ;
    }
    public void execute(QueueableContext context) {
       List<Contact> lstCon = new List<Contact>();
        for (Account account : [SELECT id,Name, BillingState  FROM Account WHERE BillingState = :Statename]) {
             Contact objCon = new Contact();
             objCon.LastName = account.Name+'Contact';
             objCon.AccountId = account.Id;
             lstCon.Add(objCon);
        }
        Insert lstCon ;
    }
    
    
}