Public class ProductBundle
{
@AuraEnabled
public static List<ProdWrapper>  fetchProductBundle(string strProdName)
{
    try
    {
    system.debug('===strProdName==='+strProdName);
    List<ProdWrapper> lstWrap =new List<ProdWrapper>();
    map<id,Decimal>mapProductIdtoUnitPrice = new map<id,Decimal>();
    list<PricebookEntry>lstPricebookEntry = new list<PricebookEntry>();
    
    string strQuery='SELECT id,Name,(SELECT id, Name, Parent_Product__c, Child_Product__c from Product_Bundles__r) FROM Product2 where name like \''+'%'+strProdName+'%\' ';
    system.debug('===strQuery==='+strQuery);
   
    List<product2>lstProd=database.Query(strQuery);
    set<id>setId = new set<id>();
    set<id>setallProductId = new set<id>(); 
    Map<id,Product2> mapProductIdToProduct ;
    
      for(product2 obj:lstProd)
        {
        setallProductId.add(obj.id);
        if(obj.Product_Bundles__r != null && obj.Product_Bundles__r.size()>0)
            {
               
               for(Product_Bundle__c objchild: obj.Product_Bundles__r)
               {
                 setId.add(objchild.Child_Product__c );
                 setallProductId.add(objchild.Child_Product__c );
               }
               
            }
         
        }
    system.debug('===setId==='+setId);
    system.debug('===lstProd==='+lstProd);
    system.debug('===setallProductId==='+setallProductId);   
       
    if(setallProductId !=null && setallProductId.size() > 0)       
    {       
     lstPricebookEntry=[SELECT PriceBook2.Name, Product2.Id, Product2.Name, UnitPrice, Name FROM PricebookEntry WHERE  PriceBook2.Name = 'Standard Price Book' and Product2.Id in :setallProductId];        
       
       if(lstPricebookEntry!=null && lstPricebookEntry.size()>0)        
        {       
            for(PricebookEntry obj:lstPricebookEntry)       
            {       
               mapProductIdtoUnitPrice.put(obj.Product2.Id,obj.UnitPrice);      
            }       
        }       
    }
    if(setId!=null && setId.size()>0)
    {
        mapProductIdToProduct = new Map<id,Product2>([select id,name from product2 where id in :setId]);
        
    }
    system.debug('===mapProductIdToProduct==='+mapProductIdToProduct);
    for(product2 obj:lstProd)
        {
        if(obj.Product_Bundles__r !=null && obj.Product_Bundles__r.size()>0)
            {
               
               List<ProdWrapper> lstChildWrap =new List<ProdWrapper>();
               for(Product_Bundle__c objchild: obj.Product_Bundles__r)
               {
                 
                 if(mapProductIdToProduct!=null && mapProductIdToProduct.size()>0 && mapProductIdToProduct.get(objchild.Child_Product__c )!=null)
                 {
                  lstChildWrap.add(new ProdWrapper(mapProductIdToProduct.get(objchild.Child_Product__c ),false,null,mapProductIdtoUnitPrice.get(objchild.Child_Product__c )));
                 }
                 
               }
               
              lstWrap.add(new ProdWrapper(obj,true,lstChildWrap,mapProductIdtoUnitPrice.get(obj.id)));
            
            }
            else
            {
                lstWrap.add(new ProdWrapper(obj,true,null,mapProductIdtoUnitPrice.get(obj.id)));
            }
         
        }
    system.debug('===lstWrap==='+lstWrap);
    
    return lstWrap ;
    }
    catch(Exception ex)
    {
    system.debug('===ex==='+ex);
    return null;
    }
    
 } 
   
  public class ProdWrapper implements ParentWrapper
    {
    
    @AuraEnabled public boolean IsSelected;
    @AuraEnabled public boolean IsBundleProduct;
    @AuraEnabled public Product2 objProd;
    @AuraEnabled public List<ProdWrapper>lstChild;
    @AuraEnabled public Decimal UnitPrice;      
    @AuraEnabled public Integer Qty;
    
        public ProdWrapper(product2 prod,Boolean IsBundleProduct,List<ProdWrapper>lstChild, Decimal UnitPrice)
        {
            this.IsSelected=false;
            this.objProd=prod;
            this.IsBundleProduct =IsBundleProduct;
            this.lstChild =lstChild;
            this.UnitPrice =UnitPrice;     
            Qty =1;
        }
    
    }
 
}