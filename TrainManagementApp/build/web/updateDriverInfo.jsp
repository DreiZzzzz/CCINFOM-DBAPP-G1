<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>UPDATE DRIVER CONTACT INFO</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="update_DriverInfoProcessing.jsp">
            <jsp:useBean id="B5" class="TrainManagement.Drivers" scope="session" />
            
            Driver ID: <select id="driver_id" name="driver_id">
                <%
                    B5.current_drivers(); 
                    for (int i = 0; i < B5.list_driver_id.size(); i++) {
                %>
                    <option value="<%=B5.list_driver_id.get(i)%>" ><%=B5.list_complete_name.get(i)%> </option>
                <% }
                %>
            </select> <br>
            Contact Info: <input type="text" id="contact_info" name="contact_info"> <br><br>
            
            <input type="submit" value="Enter">
        </form>
    </body>
</html>
