<%-- 
    Document   : delete_DriverProcessing
    Created on : Nov 17, 2024, 8:44:41 PM
    Author     : ZiaZandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, TrainManagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE DRIVER PROCESSING</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="B7" class= "TrainManagement.Drivers" scope ="session" />
            <%
                // request variable values from deleteDriver.jsp
                String v_driver_id = request.getParameter("driver_id"); 
                
                B7.driver_id = Integer.parseInt(v_driver_id); 

                int status = B7.delete_driver(); 

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
