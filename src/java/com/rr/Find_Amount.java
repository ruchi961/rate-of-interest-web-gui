/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rr;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Admin
 */
@WebService(serviceName = "Find_Amount")
public class Find_Amount {

  

 

    /**
     * Web service operation
     */
    @WebMethod(operationName = "EMI_Fixed")
    public double EMI_Fixed(@WebParam(name = "principal") double principal, @WebParam(name = "period") int period, @WebParam(name = "roi") double roi) {
        //TODO write your implementation code here:
        //double emi=((principal+((principal*roi*period)/100))/period*12);
        roi=roi/100;
        double emi=(principal+(principal*roi*period))/(period*12);
        emi=Math.round(emi);
        return emi;
    }

   
 
    /**
     * Web service operation
     */
    @WebMethod(operationName = "EMI_Reduced")
    public double EMI_Reduced(@WebParam(name = "principal") double principal, @WebParam(name = "period") int period, @WebParam(name = "roi") double roi) {
        //TODO write your implementation code here:
        roi=roi/(12*100);
        double emi=(principal * roi * Math.pow(1 + roi, period)) / (Math.pow(1 + roi, period) - 1);
        //double emi=principal * roi * Math.pow(1 + roi, period);
        emi=Math.round(emi);
        return emi;

    }

   

    

   

    
}
