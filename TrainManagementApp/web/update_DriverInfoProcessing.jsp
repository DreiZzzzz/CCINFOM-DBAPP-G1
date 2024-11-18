<%-- 
    Document   : update_DriverInfoProcessing
    Created on : Nov 17, 2024, 9:33:05 PM
    Author     : ZiaZandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, TrainManagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UPDATE DRIVER CONTACT INFO PROCESSING</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="B3" class= "TrainManagement.Drivers" scope ="session" />
            <%
                // request variable values from updateDriverInfo.jsp
                String v_contact_info = request.getParameter("contact_info");
                String v_driver_id = request.getParameter("driver_id"); 
                
                B3.driver_id = Integer.parseInt(v_driver_id); 
                B3.contact_info = v_contact_info;

                int status = B3.update_driver_contactInfo(); 

                if (status == 1) {
            %>
                   <h1>OPERATION SUCCESSFUL!</h1>
            <%   } else {
            %>     <h1>OPERATION FAILED!</h1>
            <% }
            %>
            <input type="submit" value="Return to Menu">
        </form>
    </body>
</html>
