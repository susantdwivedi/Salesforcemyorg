public with sharing class studentData{
@AuraEnabled
public static Student__c getStudentdata(string sName,string sFatName, integer rollNo, string TypeofSt,string sMobno,Decimal sStandrd,String sSkoolName,string birthdate)
{
    System.debug('----@@@@@@---Enterd Outside');
    System.debug('@@@@@@@@'+sName);
    System.debug('@@@@@@@@'+sFatName);
    System.debug('@@@@@@@@'+rollNo);
    System.debug('@@@@@@@@birthdate'+birthdate);
    Student__c objStudent = new Student__c();
    if(sName != Null && sFatName != Null && rollNo != Null && TypeofSt != Null)
    {
        System.debug('----@@@@@@---Enterd Inside');
        objStudent.Name = sName ;
        objStudent.LT_Father_Name__c = sFatName ; 
        objStudent.LT_Roll_Number__c = rollNo ;
        objStudent.LT_Type_Of_Student__c = TypeofSt;
        objStudent.Mobile_Number__c = sMobno;
        objStudent.LT_Standard__c = sStandrd;
        objStudent.LT_School_Name__c = sSkoolName;
        objStudent.LT_Date_of_Birth__c = Date.valueOf(birthdate);
        insert objStudent;
    }
    return objStudent ;
}
@AuraEnabled
public static Student__c getStudentdata(date objDOB, string objName, String objAddress)
{
    System.debug('----@@@@@@---Enterd Outside');
    System.debug('@@@@@@@@'+objDOB);
    System.debug('@@@@@@@@'+objAddress);
    
    Student__c objStudent = new Student__c();
    objStudent.Name = objName;
    objStudent.LT_Address__c= objAddress; 
    objStudent.LT_Date_of_Birth__c = objDOB;
        
    insert Objstudent;
    return Objstudent;
}
    
    @AuraEnabled
public static void insertStudentdata(Student__c objStudent)
{
    System.debug('----@@@@@@---Enterd Outside');
   // System.debug('@@@@@@@@'+objDOB);
   // System.debug('@@@@@@@@'+objAddress);
    
    //Student__c objStudent = objStudent;
    
        
    insert Objstudent;
   // return Objstudent;
}
}