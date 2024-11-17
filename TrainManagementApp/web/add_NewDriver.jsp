<%-- 
    Document   : add_NewDriver.jsp
    Created on : Nov 17, 2024, 7:39:02 PM
    Author     : ZiaZandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, TrainManagement.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD NEW DRIVER</title>
    </head>
    <body>
        <form action="index.html">
            <jsp:useBean id="C" class= "TrainManagement.Drivers" scope ="session" />
            <%
                // request variable values from addNewDrivers.html
                String v_first_name = request.getParameter("first_name"); 
                String v_last_name = request.getParameter("last_name"); 
                String v_contact_info = request.getParameter("contact_info"); 

                // assigns extracted variable from addNewDrivers.html to variables of the java object
                C.first_name = v_first_name; 
                C.last_name = v_last_name;
                C.contact_info = v_contact_info; 

                int status = C.register_newDriver(); 

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
