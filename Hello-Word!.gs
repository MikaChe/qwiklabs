function FirstExampleFunc() 

//var ss = SpreadsheetApp.getActiveSpreadsheet();    
// var sheet = ss.getSheets()[0];
// sheet.getRange("A1").setValue("Содержимое ячейки");

{
//     var row = data[i];
//     var name = row[0]; 
     var email = 'mikhai.cherkas@mfstrategy.com';    
     var subject = "Тема письма";
     var message = "Здравствуйте, Mikhail!";   
     MailApp.sendEmail(email, subject, message);  

//  Browser.msgBox("Это таки JS, Мишаня!");
}