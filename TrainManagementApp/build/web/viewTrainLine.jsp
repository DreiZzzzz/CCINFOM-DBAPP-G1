<%-- 
    Document   : viewTrainLine
    Created on : Nov 17, 2024, 10:39:24 PM
    Author     : ZiaZandre
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, TrainManagement.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VIEWING TRAIN LINES</title>
    </head>
    <body>
        <jsp:useBean id="C" class="TrainManagement.AddTrainLine" scope="session" />
        <%
            C.display_trainLine_records();; // 
        %>
        
        <center>
            <h1>Driver Records</h1>
            <table border="1">
                <tr>
                    <th>Train Line ID</th>
                    <th>Line Name</th>
                    <th>Company Handler</th>
                    <th>Operational</th>
                </tr>
                <% 
                    for (int i = 0; i < C.list_trainLineID.size(); i++) { 
                %>
                <tr>
                    <td><%= C.list_trainLineID.get(i) %></td>
                    <td><%= C.list_lineName.get(i) %></td>
                    <td><%= C.list_company_handler.get(i) %></td>
                    <td><%= C.list_isOperational.get(i) %></td>
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
