<%-- 
    Document   : table
    Created on : Mar 10, 2022, 9:58:11 PM
    Author     : pc
--%>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tag" tagdir= "/WEB-INF/tags" %>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>


<%@attribute name="${listO}" %>

<%-- any content can be specified here e.g.: --%>
<table class="table table-responsive table-borderless">
    <thead>
    <caption>Order List</caption>
    <tr class="bg-light">                         
        <th scope="col" width="5%">#ORDERID</th>
        <th scope="col" >Date</th>
        <th scope="col" >Payment Status</th>
        <th scope="col" width="5%">UserID</th>
        <th scope="col" >UserName</th>
        <th scope="col" >Name Customer</th>
        <th scope="col" >Delivery Start</th>
        <th scope="col" >Ship Status</th>
        <th scope="col" >Ship To Customer</th>
        <th scope="col" >Done Ship</th>
        <th scope="col" >Total payment</th>             
    </tr>
</thead>
<tbody>
    <c:forEach items="${listO}" var="order">
        <tr>
            <th scope="row"><input class="form-check-input" type="checkbox"></th>
            <td>${order.orderid}</td>
            <td>${order.orderdate}</td>
            <c:choose>
                <c:when test = "${order.paymentstatus == 'SUCCESS'}">
                    <td><i class="fa fa-check-circle-o green"></i><span class="ms-1">${order.paymentstatus}</span></td>
                        </c:when>
                        <c:when test = "${order.paymentstatus == 'FAIL'}">
                    <td><i class="fa fa-dot-circle-o text-danger"></i><span class="ms-1">${order.paymentstatus}</span></td>
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                    </c:choose>                                               
            <td>${order.userid}</td>
            <td>${order.username}</td>
            <td><img src="https://i.imgur.com/VKOeFyS.png" width="25"> ${order.name}</td>
            <td>${order.deliverystartdate}</td>
            <td>${order.shipstatus}</td>
            <td><button onclick="window.location.href = '${pageContext.request.contextPath}/admin/order/shiptocustomer?orderid=${order.orderid}'">Ship Now</button></td>
            <td><button onclick="window.location.href = '${pageContext.request.contextPath}/admin/order/doneship?orderid=${order.orderid}'">Done Ship</button></td>
            <td> ${order.totalamount}</td>  
        </tr>
    </c:forEach>
</tbody>
</table>