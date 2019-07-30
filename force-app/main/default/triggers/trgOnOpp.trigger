trigger trgOnOpp on Opportunity (before delete) {
    if(Trigger.isBefore && Trigger.isDelete){
        String strAdminstrator =[SELECT id FROM Profile WHERE Name='System Administrator'].Id;
        for(Opportunity objOpp:Trigger.old){
            if(Userinfo.getProfileId() == strAdminstrator){
                 objOpp.addError('You don\'t have authority to delete Opportunity');
            }
        }
    }

}