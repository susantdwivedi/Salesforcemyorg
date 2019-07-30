trigger MaintenanceRequest on Case (before update, after update) {
    // call MaintenanceRequestHelper.updateWorkOrders  
    // 
    Map<Id,Case> applicableCases = new Map<Id,Case>();
    
    if(Trigger.isUpdate  && Trigger.isAfter){
        for(Case oCase: Trigger.new){
            if (oCase.IsClosed && (oCase.Type.equals('Repair') || oCase.Type.equals('Routine Maintenance'))){
                applicableCases.put(oCase.Id, oCase);
            }
        }
        if(!applicableCases.values().isEmpty()){
            MaintenanceRequestHelper.updateWorkOrders(applicableCases);    
        }        
    } 
}