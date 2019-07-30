public class InsertContactController {
   
    @AuraEnabled
	Public static WrapContactwithDetails FungetObjectStruncture()
    {
        WrapContactwithDetails ObjWrapToReturn = new WrapContactwithDetails();
        return ObjWrapToReturn;
    }
    public InsertContactController()
    {
        WrapContactwithDetails objTemp = new WrapContactwithDetails();
        
    }
    @AuraEnabled
    public static WrapContactwithDetails insertContact(string JsonStringWrapOBj)
    {
       system.debug('JsonStringWrapOBj@@@@@@'+JsonStringWrapOBj);
        WrapContactwithDetails wrapdata = (WrapContactwithDetails)JSON.deserialize(JsonStringWrapOBj, WrapContactwithDetails.class);
        system.debug('ObjWrap@@@@@'+wrapdata); 
        Contact objCon = new Contact();
       /* if(wrapdata.EmpName != null && wrapdata.EmpName.split(' ') != null)
        {
            list<string> NameofEmp = wrapdata.EmpName.split(' ');
            if(NameofEmp != null && NameofEmp.[0] != null && NameofEmp.[1] != null)
            {
               objCon.FirstName = NameofEmp.[0];
               objCon.LastName = NameofEmp.[1];
            }
        } */
        if(wrapdata.EmpName != null )
        {
               objCon.FirstName = wrapdata.EmpName;
               objCon.LastName = wrapdata.EmpName;
        }
        if(wrapdata.EmpPhone != null )
        {
               objCon.Phone = wrapdata.EmpPhone;
        }
        if(wrapdata.EmpEmail != null )
        {
               objCon.Email = wrapdata.EmpEmail;
        }
        if(wrapdata.EmpMobile != null )
        {
               objCon.MobilePhone = wrapdata.EmpMobile;
        }
        if(wrapdata.EmpName != null )
        {
               objCon.FirstName = wrapdata.EmpName;
               objCon.LastName = wrapdata.EmpName;
        }
        try{
            insert objCon;
            wrapdata.EmpStatus ='Sucess';
            wrapdata.EmpSucessmessage ='Contact Sucessfully inserted';
        }
        catch(Exception e){
            wrapdata.EmpStatus ='Error';
            wrapdata.EmpErrormessage = e.getMessage();
        }
        return wrapdata;
    }
    public class WrapContactwithDetails implements ParentWrapper{
        @AuraEnabled public String EmpName;
        @AuraEnabled public String EmpEmail;
        @AuraEnabled public String EmpPhone;
        @AuraEnabled public String EmpMobile;
        @AuraEnabled public String EmpStatus;
        @AuraEnabled public String EmpErrormessage;
        @AuraEnabled public String EmpSucessmessage;
       
            }

}