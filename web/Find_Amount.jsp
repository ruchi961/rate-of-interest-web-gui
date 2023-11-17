<%-- 
    Document   : Find_Amount
    Created on : 13 Jul, 2021, 12:23:53 PM
    Author     : Admin
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GUI</title>
        <!--<script>
            for(var i=0;i<x.length;i++){
                   
                   var table=document.getElementById("myTable");
                   var row=table.insertRow(-1);
                   var cell1=row.insertCell(0);
                   var cell2=row.insertCell(1);
                   console.log(xmlDoc.getElementsByTagName("prac2")[i].childNodes[0].firstChild.nodeValue)
                   cell1.innerHTML=xmlDoc.getElementsByTagName("prac2")[i].childNodes[1].firstChild.nodeValue;
                   
                   cell2.innerHTML=xmlDoc.getElementsByTagName("prac2")[i].childNodes[0].firstChild.nodeValue;
                }*</script>-->
    </head>
    <body>
        <form method="post">
           
            Name : 
            <input type="text" name="name"><br><br>
            Age : 
            <input type="text" name="age"><br><br>
            Contact Number : 
            <input type="text" name="no"><br><br>
            Amount : 
            <input type="text" name="amt"><br><br>
            Loan Type :
            <select name="loantype">
                            <option value="Personal Loan">Personal Loan</option>
                            <option value="Gold Loan">Gold Loan</option>
                            <option value="Home Loan">Home Loan</option>
                            <option value="Car Loan">Car Loan</option>
                            <option value="Education Loan">Education Loan</option>
                                
            </select><br><br>
            Rate of Interest (p.a.) : 
            <input type="text" name="RTI"><br><br>
            Period (in years) : 
            <input type="text" name="years"><br><br>
            
            
            <input type="submit" value="Submit" name="btnsubmit"><br><br>
         
             <% 
            
            
            try{
                double amt=Float.parseFloat(request.getParameter("amt"));
                String type=request.getParameter("loantype");
                String name=request.getParameter("name");
                String age=request.getParameter("age");
                String no=request.getParameter("no");
                
                double roi=Float.parseFloat(request.getParameter("RTI"));;
                int year=Integer.parseInt(request.getParameter("years"));
         
                int noMonthlyInstallment=year*12;
                
                
               
                com.rr.Find_Amount obj=new com.rr.Find_Amount();
                double monthlyEMIFixed=obj.EMI_Fixed(amt,year,roi);
                
                double monthlyEMIReduced=obj.EMI_Reduced(amt,noMonthlyInstallment,roi);
                out.println("<br><br><b>Name : </b>"+name+".<br><hr><br>");
                out.println("<br><br><b>Age : </b>"+age+".<br><hr><br>");
                out.println("<br><br><b>Contact No. : </b>"+no+".<br><hr><br>");
                
                out.println("<br><br><b>Loan Type : </b>"+type+".<br><hr><br>");
                //to round up to two decimals 
                //out.println("<br><br><b>Monthly EMI (Fixed) :  </b>"+ Math.round(monthlyEMIFixed*100.0)/100.0+".<br><br>");
                out.println("<br><br><b>Monthly EMI (Flat) :  </b>"+ monthlyEMIFixed+".<br><br>");
                
                double Total_fixed= monthlyEMIFixed*noMonthlyInstallment;
               
                out.println("<br><br><b>Total Amount to pay (Flat) : </b>"+monthlyEMIFixed*noMonthlyInstallment+".<br><br>");
                
                double Total_reduced= monthlyEMIReduced*noMonthlyInstallment;
                out.println("<hr><br><br><b>Monthly EMI (Reduced) : </b>"+ monthlyEMIReduced+".<br><br>");
                
                
                out.println("<br><br><b>Total Amount to pay (Reduced) : </b>"+monthlyEMIReduced*noMonthlyInstallment+".");
            }catch(Exception e){
                System.out.println(e);
            }
            
            %>
        </form>
    </body>
</html>
