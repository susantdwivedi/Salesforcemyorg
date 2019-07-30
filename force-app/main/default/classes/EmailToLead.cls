/**
 * Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
global class EmailToLead implements Messaging.InboundEmailHandler {
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, 
                                                       Messaging.InboundEnvelope env){
    // Create an InboundEmailResult object for returning the result of the  
    // Apex Email Service 
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
    String myPlainText= '';

    // Add the email plain text into the local variable  
    myPlainText = email.plainTextBody;

    // Check for existing leads with this email address   
    List<Lead> leads = new List<Lead>([SELECT Id, FirstName, LastName, Name, Company, LeadSource, Description, Email
      FROM Lead
      WHERE Email = :email.fromAddress]);
    
    if (leads.size() == 0) {
      // New Lead object to be created - set LastName and Company to
      // dummy values for simplicity
      Lead newLead = new Lead(Email = email.fromAddress,
        FirstName = '' ,
        LastName = email.fromName, 
        Company = 'From Email',
        LeadSource = 'Email',
        Description = email.plainTextBody);

      // Insert a new lead
      insert newLead;    

      System.debug('New Lead record: ' + newLead );   
    } else 
    {
      System.debug('Incoming email duplicates existing Lead record(s): ' + leads ); 
      for(Lead objLead : leads)
      {
          if(objLead.LastName != email.fromName && objLead.FirstName == '')
          {
             objLead.LastName = email.fromName; 
          }
          if(objLead.Description  == '')
          {
             objLead.Description = email.plainTextBody; 
          }
          if(objLead.Company  == '')
          {
             objLead.Company = 'From Email'; 
          }
      }
      if(leads != Null && leads.size() > 0)
      {
         update leads; 
      }
      
    }

    // Set the result to true. No need to send an email back to the user      
    // with an error message   
  //  result.success = true;

    // Return the result for the Apex Email Service 
    return result;
  }
}