public with sharing class PositionNoteDealActionController {
    // Variabale defined
    public Opportunity positionNote{get;set;}
    
    public PositionNoteDealActionController(ApexPages.StandardController controller) {
        
        positionNote = new Opportunity();
        
    }

}