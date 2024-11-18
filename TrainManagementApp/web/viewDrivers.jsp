<%-- 
    Document   : viewDrivers
    Created on : Nov 17, 2024, 9:40:08 PM
    Author     : ZiaZandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, TrainManagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEWING DRIVERS</title>
    </head>
    <body>
        <jsp:useBean id="B" class="TrainManagement.Drivers" scope="session" />
        <jsp:scriptlet>
            B.display_driverRecords(); // Populate the driver's data into the lists
        </jsp:scriptlet>
        
        <center>
            <h1>Driver Records</h1>
            <table border="1">
                <tr>
                    <th>Driver ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Contact Info</th>
                </tr>
                <% 
                    for (int i = 0; i < B.list_driver_id.size(); i++) { 
                %>
                <tr>
                    <td><%= B.list_driver_id.get(i) %></td>
                    <td><%= B.list_first_name.get(i) %></td>
                    <td><%= B.list_last_name.get(i) %></td>
                    <td><%= B.list_contact_info.get(i) %></td>
                </tr>
                <% 
                    } 
                %>
            </table>
            <br>
            <form action="index.html">
                <input type="submit" value="Return to Menu">
            </form>
        </center>
    </body>
</html>

