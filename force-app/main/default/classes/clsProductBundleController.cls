public class clsProductBundleController {
    public list<warpperwithdata> lstwarapdata{get;set;}
    
    @AuraEnabled
    public static void returnProductbundle(String productName){
     
     list<Product2> lstProduct=[SELECT id, Name, IsActive, ProductCode, Description,(SELECT id ,Name, PRICEBOOK2ID, PRODUCT2ID, UnitPrice, IsActive, USESTANDARDPRICE FROM PricebookEntries) ,Family FROM Product2 WHERE Name LIKE :productName ];
     list<Product_Bundle__c> lstProdbu =[SELECT id, Name, Parent_Product__c, Parent_Product__r.Name, Child_Product__c , Child_Product__r.Name FROM Product_Bundle__c ];
     // list<PriceBookEntry> lstPBEntry = [SELECT id ,Name, PRICEBOOK2ID, PRODUCT2ID, UNITPRICE, ISACTIVE, USESTANDARDPRICE FROM PriceBookEntry ]; 
     if(lstProduct != null && lstProduct.size() > 0)
     {
         for(Product2 objPro : lstProduct)
         {
             
         }
     }
    } 
    
    public class warpperwithdata{
        @AuraEnabled public String wrapBundname{get;set;}
        @AuraEnabled public Boolean IswrapBundle{get;set;}
        @AuraEnabled public Boolean IsSelected{get;set;}
        @AuraEnabled public String wrapBundPrname{get;set;}
        @AuraEnabled public integer wrapBundPAprice{get;set;}
        @AuraEnabled public integer wrapBundPLprice{get;set;}
        @AuraEnabled public integer wrapBundQuantity{get;set;}
    }
    
}