<%-- 
    Document   : deleteDriver
    Created on : Nov 17, 2024, 8:06:58 PM
    Author     : ZiaZandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*, TrainManagement.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DELETE DRIVER</title>
    </head>
    <body>
        <form action ="delete_DriverProcessing.jsp">
            <jsp:useBean id="B9" class="TrainManagement.Drivers" scope="session" />
            Driver ID: <select id="driver_id" name="driver_id">
                <%
                    B9.current_drivers(); 
                    for (int i = 0; i < B9.list_driver_id.size(); i++) {
                %>
                    <option value="<%=B9.list_driver_id.get(i)%>" ><%=B9.list_complete_name.get(i)%> </option>
                <% }
                %>
            </select> <br>
            
            <input type="submit" value="Enter">
        </form>
    </body>
</html>
