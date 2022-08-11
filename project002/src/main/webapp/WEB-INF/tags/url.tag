<%-- 
    Document   : url
    Created on : Mar 18, 2022, 6:39:20 AM
    Author     : pc
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="brandid"%>
<%@attribute name="colorid"%>
<%@attribute name="size"%>
<%@attribute name="price1"%>
<%@attribute name="price2"%>
<%@attribute name="page"%>


<%-- any content can be specified here e.g.: --%>

<c:url var="myURL222" value="./listing">
    <c:if test = "${brandid > 0 && brandid != '' && brandid != null}">
        <c:param name="colorid" value="${brandid}"/>
    </c:if>  

    <c:if test = "${colorid > 0 && colorid != '' && colorid != null}">
        <c:param name="colorid" value="${colorid}"/>
    </c:if>  

    <c:if test = "${size > 0 && size != '' && size != null}">
        <c:param name="size" value="${size}"/>
    </c:if>  

    <c:if test = "${(price1 >= 0 && price2 > 0) && price1 != '' && price1 != null  && price2 != '' && price2 != null}">
        <c:param name="price1" value="${price1}"/>
        <c:param name="price2" value="${price2}"/>
    </c:if> 

    <c:if test = "${(page >= 0 && page > 0) && page != '' && page != null  && page != '' && page != null}">
        <c:param name="page" value="${page}"/>     
    </c:if> 
</c:url>