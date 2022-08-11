<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tag" tagdir= "/WEB-INF/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    </head>
    <body>
        <input type="button" value="Button1" onclick='myfunction();'>
        <div id="displaytable" style="visibility: hidden">
            <table id="displaytable" style="display: none; width: 100%" cellpadding="1" cellspacing="0" border="3">
                <tr align="center">
                    <td class="lbl">column1</td>
                    <td class="lbl">column2</td>
                    <td class="lbl">column3</td>
                </tr>
                <tr>
                    <td align="center">1</td>
                    <td align="center">2</td>
                    <td align="center">33</td>
                </tr>
                <tr>
                    <td align="center">4</td>
                    <td align="center">5</td>
                    <td align="center">6</td>
                </tr>
            </table> 
            <script>function myfunction()
                {
                    if (document.getElementById("displaytable").style.display === "none")
                        document.getElementById("displaytable").style.display = "block";
                    else
                        document.getElementById("displaytable").style.display = "none";
                }</script>
        </div>
    </body>






</html>