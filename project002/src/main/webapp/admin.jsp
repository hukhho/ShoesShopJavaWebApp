<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Admin - ${tittle}</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/form.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>


    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">ADMIN</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">

                        <li class="nav-item" >
                            <a class="nav-link" href = "${pageContext.request.contextPath}/admin/order" > Order </a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href = "${pageContext.request.contextPath}/admin/user" > User </a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href = "${pageContext.request.contextPath}/admin/product" > Product </a>
                        </li>
                        <li class="nav-item" >
                            <a class="nav-link" href = "${pageContext.request.contextPath}/admin/inventory" > Product Inventory </a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Others
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/brand" > Brand </a>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/color" > Color </a>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/logsomething" > Log Deleted </a>
                            </ul>
                        </li>

                    </ul>
                </div>
                <form class="form-inline mr-auto" target="_self"> </form><span class="navbar-text"> <a href="${pageContext.request.contextPath}/adminlogin?logout=true" class="login">Logout</a></span>

            </div>
        </nav>



        <div>


            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>



            <div class="container mt-5 px-2">


                <c:if test = "${errorMess != 'null'}">
                    <div class="alert alert-danger" role="alert">
                        ${errorMess}
                    </div>
                </c:if>
                <c:choose>
                    <c:when test = "${statusColor == 'green'}">
                        <div class="alert alert-success d-flex align-items-center" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
                            <div>
                                ${status}
                            </div>
                        </div>
                    </c:when>


                    <c:when test = "${statusColor == 'red'}">
                        <div class="alert alert-danger d-flex align-items-center" role="alert">
                            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                            <div>
                                ${status}
                            </div>
                        </div>
                    </c:when>

                    <c:otherwise>
                    </c:otherwise>
                </c:choose>



                <c:choose>
                    <c:when test = "${tittle == 'order'}">

                        <div class="mb-2 d-flex justify-content-between align-items-center">
                            <div class="position-relative">
                                <form action="${pageContext.request.contextPath}/admin/order&ascdesc=${param.ascdesc}&orderby=${param.orderby}" method="post">
                                    </br>Search Order
                                    <input name="searchkey" class="form-control w-100" placeholder="Search Order"> <span class="position-absolute search"><i class="fa fa-search"></i></span> 
                                    </br>Search Field
                                    <select name="searchfield" class="form-control w-20" class="form-select form-select-sm" class="dropdown-menu">

                                        <option class="dropdown-item" value="orderid">Order ID</option>
                                        <option value="userid">User ID</option>
                                        <option value="name">Name Customer</option>
                                        <option value="shipstatus">Ship Status</option>
                                        <option value="paymentstatus">Payment Status</option>
                                        <option value="deliverystartdate">Delivery Start</option>
                                        <option value="totalamount">Total</option>

                                    </select>

                                    <input name="page" type="hidden" value="1">
                                    <input name="orderby" type="hidden" value="${param.orderby}">
                                    <input name="ascdesc" type="hidden" value="${param.ascdesc}">                                  
                                </form>
                            </div>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Sorted by
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=orderid&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Order ID</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=userid&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">User ID</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=name&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Name Customer</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=orderdate&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Date</a></li>

                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=deliverystartdate&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Delivery Start</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=totalamount&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Total</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=shipstatus&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Ship Status</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?orderby=paymentstatus&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Payment Status</a></li>
                            </ul>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm" type="button">
                                Ascending or Decrease
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?ascdesc=asc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Ascending</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/order?ascdesc=desc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Decrease</a></li>
                            </ul>
                        </div>            


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
                                <th scope="col" >View items</th>
                                <th scope="col" >Total payment</th> 
                            </tr>
                            </thead>
                            <caption>Management ${tittle} - Showing ${totalShow} of ${totalOrder}</caption>

                            <tbody>
                                <c:forEach items="${listO}" var="order">
                                    <tr>                                                     
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
                                        <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/order/shiptocustomer?orderid=${order.orderid}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}&page=${param.page}'">Ship Now</button></td>
                                        <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/order/doneship?orderid=${order.orderid}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}&page=${param.page}'">Done Ship</button></td>
                                        <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/order/vieworder?itemorderid=${order.orderid}&itemuserid=${order.userid}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}&page=${param.page}'">View items</td>
                                        <td>${order.totalamount}</td>                                          
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item ${param.page == 1 || param.page == null || param.page == '' ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${param.page-1}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}" tabindex="-1">Previous</a>
                                </li>
                                <c:forEach var = "i" begin = "1" end = "${totalPage}">
                                    <li class="page-item ${i == param.page ? 'active':''}"><a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${i}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">${i}</a></li>                                   
                                    </c:forEach>

                                <li class="page-item ${param.page == totalPage ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/order?page=${param.page+1}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Next</a>
                                </li>
                            </ul>
                        </nav>


                        <div class="modal fade" id="exampleModal" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Order List Item</h5>

                                        <button type="button" onclick="myFunction()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-show-table" action="${pageContext.request.contextPath}/admin/order/vieworder" method="post">

                                            <div class="form-group">
                                                <label for="userid" class="col-form-label">User ID: </label>
                                                <input name="userid" readonly class="form-control" id="userid" value="${param.itemuserid}">
                                            </div>
                                            <div class="form-group">
                                                <label for="userid" class="col-form-label">Oder ID: </label>
                                                <input name="userid" readonly class="form-control" id="userid" value="${param.itemorderid}">
                                            </div>

                                            <div class="form-group">
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">PIID</th>
                                                            <th scope="col">PID</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Size</th>
                                                            <th scope="col">Color</th>
                                                            <th scope="col">Quantity</th>
                                                            <th scope="col">Price per 1</th>
                                                        </tr>
                                                    </thead>
                                                    <caption>Management ${tittle} - Showing ${totalShow} of ${totalOrder}</caption>
                                                    <tbody>
                                                        <c:forEach items="${ordermap}" var = "item">
                                                            <tr>
                                                                <td>${item.key.itempiid}</td>
                                                                <td>${item.value.pid}</td>
                                                                <td>${item.value.name}</td>
                                                                <td>${item.value.size}</td>
                                                                <td>${item.value.colorname}</td>
                                                                <td>${item.key.itemquantity}</td>
                                                                <td>${item.key.priceitem}</td>
                                                            </tr>
                                                        </c:forEach>

                                                    </tbody>
                                                </table>
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="myFunction()" class="btn btn-secondary" data-dismiss="modal">Close</button> 
                                    </div>  

                                    <script>
                                        function myFunction() {
                                            $('#exampleModal').modal('hide');
                                        }
                                    </script>

                                    <c:if test = "${open == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModal').modal('show');
                                            });
                                        </script>
                                    </c:if>

                                </div>
                            </div>
                        </div>





                    </c:when>             
                    <c:when test = "${tittle == 'user'}"> 
                        <div class="mb-2 d-flex justify-content-between align-items-center">
                            <div class="position-relative">
                                <form action="${pageContext.request.contextPath}/admin/user" method="post">
                                    </br>Search Key
                                    <input name="searchkey" class="form-control w-100" placeholder="Search User"> <span class="position-absolute search"><i class="fa fa-search"></i></span> 
                                    </br>Search Field
                                    <select name="searchfield" class="form-control w-20" class="form-select form-select-sm" class="dropdown-menu">
                                        <option class="dropdown-item">ID</option>
                                        <option>Username</option>
                                        <option>Name</option>
                                        <option>Sex</option>
                                        <option>Email</option>
                                        <option>Phone</option>  
                                        <option>Regtime</option>  
                                    </select>

                                    <input name="page" type="hidden" value="1">
                                    <input name="orderby" type="hidden" value="${param.orderby}">
                                    <input name="ascdesc" type="hidden" value="${param.ascdesc}">
                                </form>
                            </div>
                        </div>


                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Sorted by
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?orderby=id&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">ID</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?orderby=username&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Username</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?orderby=name&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Name</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?orderby=sex&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Sex</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?orderby=phone&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Phone</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?orderby=cash&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Cash</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?orderby=regtime&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Regtime</a></li>
                            </ul>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm" type="button">
                                Ascending or Decrease
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?ascdesc=asc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Ascending</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/user?ascdesc=desc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Decrease</a></li>
                            </ul>
                        </div>


                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">      
                                    <th scope="col" >#ID</th>
                                    <th scope="col" >Username</th>
                                    <th scope="col" >Password</th>
                                    <th scope="col" >Name</th>                               
                                    <th scope="col" >Sex</th>
                                    <th scope="col" >Email</th>
                                    <th scope="col" >Phone</th>
                                    <th scope="col" >Cash</th>
                                    <th scope="col" >Regtime</th>
                                    <th scope="col" class="text-end"><span>Edit</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            <caption>Management ${tittle} - Showing ${totalShow} of ${totalUser}</caption>

                            <c:forEach items="${listuser}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.username}</td>
                                    <td>${user.password}</td>
                                    <td>${user.name}</td>
                                    <td>${user.sex}</td>
                                    <td>${user.email}</td>
                                    <td>${user.phone}</td>                                       
                                    <td>${user.cash}</td>
                                    <td>${user.regtime}</td>                                    
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/user/edituser?userid=${user.id}'">Edit</button></td>                                    
                                </tr>           
                            </c:forEach>  


                            </tbody>
                        </table>

                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item ${param.page == 1 || param.page == null || param.page == '' ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/user?page=${param.page-1}" tabindex="-1">Previous</a>
                                </li>
                                <c:forEach var = "i" begin = "1" end = "${totalPage}">
                                    <li class="page-item ${i == param.page ? 'active':''}"><a class="page-link" href="${pageContext.request.contextPath}/admin/user?page=${i}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">${i}</a></li>                                   
                                    </c:forEach>

                                <li class="page-item ${param.page == totalPage ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/user?page=${param.page+1}">Next</a>
                                </li>
                            </ul>
                        </nav>



                        <div class="modal fade" id="exampleModal" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">

                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit User Info</h5>
                                        <button type="button" onclick="myFunction()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-edit-user" action="${pageContext.request.contextPath}/admin/user/edituser" method="post">
                                            <div class="form-group">
                                                <label for="userid" class="col-form-label">User ID: </label>
                                                <input name="userid" readonly class="form-control" id="userid" value="${userid}">
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Name: </label>
                                                <input name="name" type="text" class="form-control" id="name" value="${name}">
                                            </div>
                                            <div class="form-group">
                                                <label for="pass" class="col-form-label">Pass: </label>
                                                <input name="pass" type="text" class="form-control" id="pass" value="${pass}">
                                            </div>
                                            <div class="form-check">
                                                <input name="sex" type="radio" class="form-check-input" id="radio1" name="optradio" value="Male" checked>Male
                                                <label class="form-check-label" for="radio1"></label>
                                            </div> 
                                            <div class="form-check">
                                                <input name="sex" type="radio" class="form-check-input" id="radio2" name="optradio" value="Fermale">Fermale
                                                <label class="form-check-label" for="radio2"></label>
                                            </div>
                                            <div class="form-group">
                                                <label for="email" class="col-form-label">Email : </label>
                                                <input name="email" type="text" class="form-control" id="userid" value="${email}">
                                            </div>
                                            <div class="form-group">
                                                <label for="phone" class="col-form-label">Phone : </label>
                                                <input name="phone" type="text" class="form-control" id="phone" value="${phone}">
                                            </div>
                                            <div class="form-group">
                                                <label for="address" class="col-form-label">Address: </label>
                                                <input name="address" type="text" class="form-control" id="userid" value="${address}">
                                            </div>
                                            <div class="form-group">
                                                <label for="cash" class="col-form-label">Cash : </label>
                                                <input name="cash" type="text" class="form-control" id="cash" value="${cash}">
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="myFunction()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                                            Edit
                                        </button>
                                    </div>  

                                    <script>
                                        function myFunction() {
                                            $('#exampleModal').modal('hide');
                                        }
                                    </script>

                                    <c:if test = "${open == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModal').modal('show');
                                            });
                                        </script>
                                    </c:if>

                                </div>
                            </div>
                        </div>


                        <!-- Button trigger modal -->
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Edit confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-edit-user" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:when>


                    <c:when test = "${tittle == 'product'}">

                        <div class="mb-2 d-flex justify-content-between align-items-center">
                            <div class="position-relative">
                                <form action="${pageContext.request.contextPath}/admin/product&ascdesc=${param.ascdesc}&orderby=${param.orderby}" method="get">
                                    </br>Search Order
                                    <input name="searchkey" class="form-control w-100" placeholder="Search Product"> <span class="position-absolute search"><i class="fa fa-search"></i></span> 
                                    </br>Search Field
                                    <select name="searchfield" class="form-control w-20" class="form-select form-select-sm" class="dropdown-menu">
                                        <option class="dropdown-item" value="pid">PID</option>

                                        <option value="name">Product Name</option>
                                        <option value="brandname">Brand </option>
                                        <option value="review">Review</option>
                                        <option value="amount">Total Quantity</option>

                                    </select>

                                    <input name="page" type="hidden" value="1">
                                    <input name="orderby" type="hidden" value="${param.orderby}">
                                    <input name="ascdesc" type="hidden" value="${param.ascdesc}">                                  
                                </form>
                            </div>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Sorted by
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product?orderby=pid&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">PID</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product?orderby=name&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Product Name</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product?orderby=brandname&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Brand</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product?orderby=price&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Price</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product?orderby=amount&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Total quanity</a></li>
                                <li><hr class="dropdown-divider"></li>      
                            </ul>
                        </div>
                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm" type="button">
                                Ascending or Decrease
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product?ascdesc=asc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Ascending</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/product?ascdesc=desc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Decrease</a></li>
                            </ul>
                        </div>            


                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">
                                    <th scope="col" >#PID</th>
                                    <th scope="col" >Product Name</th>
                                    <th scope="col" >Brand ID</th> 
                                    <th scope="col" >Brand Name</th>
                                    <th scope="col" >Price</th>                                        
                                    <th scope="col" >Review</th>
                                    <th scope="col" >Image_Link</th>
                                    <th scope="col" >Total Quantity</th>

                                    <th scope="col" >Delete (If not used anytime)</th>
                                    <th scope="col" >Add inventory </th>
                                    <th scope="col" class="text-end"><span>Edit</span></th>
                                </tr>
                            </thead>

                            <tbody>
                            <caption>Management ${tittle} - Showing ${totalShow} of ${totalProduct}</caption>

                            <c:forEach items="${listP}" var="product">
                                <tr>
                                    <td>${product.pid}</td>
                                    <td>${product.name}</td>
                                    <td>${product.brandid}</td>
                                    <td>${product.brandname}</td>
                                    <td>${product.price}</td>
                                    <td>${product.review}</td>
                                    <td><img src="${product.image_link}"  width="100" height="100"></td>
                                    <td>${product.totalQuantity}</td>
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/product/delete?pid=${product.pid}&openDelete=true'">Delete</button></td> 
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/inventory?searchkey=${product.pid}&searchfield=pid'">Go to inventory</button></td>                                    
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/product/editproduct?pid=${product.pid}'">Edit</button></td>                                    
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>    

                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item ${param.page == 1 || param.page == null || param.page == '' ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${param.page-1}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}" tabindex="-1">Previous</a>
                                </li>
                                <c:forEach var = "i" begin = "1" end = "${totalPage}">
                                    <li class="page-item ${i == param.page ? 'active':''}"><a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${i}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">${i}</a></li>                                   
                                    </c:forEach>

                                <li class="page-item ${param.page == totalPage ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/product?page=${param.page+1}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Next</a>
                                </li>
                            </ul>
                        </nav>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add product</button>

                        <div class="modal fade" id="exampleModal" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-add-product" action="${pageContext.request.contextPath}/admin/product/addproduct" method="post">
                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" type="text" class="form-control" id="pid" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Name: </label>
                                                <input name="name" type="text" class="form-control" id="pid" value="">                                           
                                            </div>
                                            <select name="brandid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">

                                                <option selected>Open this select menu</option>
                                                <c:forEach items="${listbr}" var="br">
                                                    <option value="${br.brandid}">${br.brandname}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-group">
                                                <label for="price" class="col-form-label">Price: </label>
                                                <input name="price" type="text" class="form-control" id="price" value="">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="review" class="col-form-label">Review: </label>
                                                <input name="review" type="text" class="form-control" id="review" value="">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="image_link" class="col-form-label">Image_link </label>
                                                <input name="image_link" type="text" class="form-control" id="image_link" value="">                                           
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">

                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeAdd()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropAdd">
                                            Add
                                        </button>
                                    </div>  

                                    <script>
                                        function closeAdd() {
                                            $('#exampleModal').modal('hide');
                                        }
                                    </script>


                                </div>
                            </div>
                        </div>



                        <div class="modal fade" id="exampleModalEdit" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit Product</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-edit-product" action="${pageContext.request.contextPath}/admin/product/editproduct" method="post">
                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" readonly class="form-control" id="pid" value="${pid}">
                                            </div>
                                            <div class="form-group">
                                                <label for="name" class="col-form-label">Name: </label>
                                                <input name="name" type="text" class="form-control" id="pid" value="${name}">                                           
                                            </div>
                                            <select name="brandid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                <option selected value="${brandid}">${br.brandname}</option>
                                                <c:forEach items="${listbr}" var="br">                                                  
                                                    <c:choose>
                                                        <c:when test = "${brandid == br.brandid}">
                                                            <option value="${br.brandid}" selected>${br.brandname}</option>  
                                                        </c:when>

                                                        <c:when test = "${brandid != br.brandid}">
                                                            <option value="${br.brandid}">${br.brandname}</option> 
                                                        </c:when>
                                                        <c:otherwise>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                            <div class="form-group">
                                                <label for="price" class="col-form-label">Price: </label>
                                                <input name="price" type="text" class="form-control" id="price" value="${price}">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="review" class="col-form-label">Review: </label>
                                                <input name="review" type="text" class="form-control" id="review" value="${review}">                                           
                                            </div>
                                            <div class="form-group">
                                                <label for="image_link" class="col-form-label">Image_link </label>
                                                <input name="image_link" type="text" class="form-control" id="image_link" value="${image_link}">                                           
                                            </div>
                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeEdit()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropEdit">
                                            Edit
                                        </button>
                                    </div>  

                                    <script>
                                        function closeEdit() {
                                            $('#exampleModalEdit').modal('hide');
                                        }
                                    </script>
                                    <c:if test = "${openEdit == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModalEdit').modal('show');
                                            });
                                        </script>
                                    </c:if> 

                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="exampleModalDelete" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                                        <button type="button" onclick="closeDelete()()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-delete-product" action="${pageContext.request.contextPath}/admin/product/delete" method="post">
                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" readonly class="form-control" id="pid" value="${param.pid}">
                                            </div>

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeDelete()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropDelete">
                                            Delete                                        </button>
                                    </div>  
                                    <script>
                                        function closeDelete() {
                                            $('#exampleModalDelete').modal('hide');
                                        }
                                    </script>
                                    <c:if test = "${param.openDelete == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModalDelete').modal('show');
                                            });
                                        </script>
                                    </c:if> 
                                </div>
                            </div>
                        </div>                                      



                        <!-- Button trigger modal -->
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdropAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content add">
                                    <div class="modal-header add">
                                        <h5 class="modal-title add" id="staticBackdropLabel">Confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Add to product. Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-add-product" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="staticBackdropEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="0" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Edit. Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-edit-product" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="staticBackdropDelete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="0" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Delete. Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-delete-product" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </c:when>



                    <c:when test = "${tittle == 'inventory'}"> 
                        <div class="mb-2 d-flex justify-content-between align-items-center">
                            <div class="position-relative">
                                <form action="${pageContext.request.contextPath}/admin/inventory?ascdesc=${param.ascdesc}&orderby=${param.orderby}" method="get">
                                    </br>Search Order
                                    <input name="searchkey" class="form-control w-100" placeholder="Search Product"> <span class="position-absolute search"><i class="fa fa-search"></i></span> 
                                    </br>Search Field
                                    <select name="searchfield" class="form-control w-20" class="form-select form-select-sm" class="dropdown-menu">
                                        <option class="dropdown-item" value="piid">PIID</option>
                                        <option value="name">Product Name</option>
                                        <option value="brandname">Brand </option>
                                        <option value="review">Review</option>
                                        <option value="amount">Total Quantity</option>

                                    </select>

                                    <input name="page" type="hidden" value="1">
                                    <input name="orderby" type="hidden" value="${param.orderby}">
                                    <input name="ascdesc" type="hidden" value="${param.ascdesc}">                                  
                                </form>
                            </div>
                        </div>

                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Sorted by
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?orderby=piid&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">PIID</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?orderby=pid&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">PID</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?orderby=name&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Product Name</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?orderby=brandname&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Brand</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?orderby=price&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Price</a></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?orderby=amount&ascdesc=${param.ascdesc}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Quanity</a></li>
                                <li><hr class="dropdown-divider"></li>      
                            </ul>
                        </div>

                        <div class="btn-group">
                            <button class="btn btn-secondary btn-sm" type="button">
                                Ascending or Decrease
                            </button>
                            <button type="button" class="btn btn-sm btn-secondary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="visually-hidden"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?ascdesc=asc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Ascending</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/inventory?ascdesc=desc&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}"}">Decrease</a></li>
                            </ul>
                        </div>      


                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">
                                    <th scope="col" >#PIID</th>
                                    <th scope="col" >Product ID</th>
                                    <th scope="col" >Product Name</th>
                                    <th scope="col" >Brand Name</th>
                                    <th scope="col" >Price</th>
                                    <th scope="col" >Review</th>
                                    <th scope="col" >Image_Link</th>
                                    <th scope="col" >Color</th>
                                    <th scope="col" >Size</th>
                                    <th scope="col" >Amount</th>
                                    <th scope="col" ></th>                            
                                    <th scope="col" class="text-end"><span>Edit</span></th>
                                </tr>
                            </thead>    
                            <tbody>
                            <caption>Management ${tittle} - Showing ${totalShow} of ${totalProduct}</caption>
                            <c:forEach items="${listfull}" var="product">
                                <tr>
                                    <td>${product.piid}</td>
                                    <td>${product.pid}</td>
                                    <td>${product.name}</td>
                                    <td>${product.brandname}</td>
                                    <td>${product.price}</td>
                                    <td>${product.review}</td>
                                    <td><img src="${product.image_link}" width="100" height="100"></td>
                                    <td>${product.colorname}</td>
                                    <td>${product.size}</td>
                                    <td>${product.amount}</td>
                                    <td><button class="btn btn-primary" onclick="window.location.href = '${pageContext.request.contextPath}/admin/inventory/edit?piid=${product.piid}&amount=${product.amount}&openEdit=true&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}'">Edit</button></td>                                    

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>    
                        <nav aria-label="Page navigation example">
                            <ul class="pagination justify-content-center">
                                <li class="page-item ${param.page == 1 || param.page == null || param.page == '' ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/inventory?page=${param.page-1}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}" tabindex="-1">Previous</a>
                                </li>
                                <c:forEach var = "i" begin = "1" end = "${totalPage}">
                                    <li class="page-item ${i == param.page ? 'active':''}"><a class="page-link" href="${pageContext.request.contextPath}/admin/inventory?page=${i}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">${i}</a></li>                                   
                                    </c:forEach>

                                <li class="page-item ${param.page == totalPage ? 'disabled':''}" >
                                    <a class="page-link" href="${pageContext.request.contextPath}/admin/inventory?page=${param.page+1}&ascdesc=${param.ascdesc}&orderby=${param.orderby}&searchkey=${param.searchkey}&searchfield=${param.searchfield}">Next</a>
                                </li>
                            </ul>
                        </nav>

                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Add New</button>

                        <div class="modal fade" id="exampleModal" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Add Inventory</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-add-inventory" action="${pageContext.request.contextPath}/admin/inventory/add" method="get">

                                            <div class="form-group">
                                                <label for="pid" class="col-form-label">PID: </label>
                                                <input name="pid" type="text" class="form-control" id="pid" value="">
                                            </div>
                                            <div class="form-group">
                                                <label for="size" class="col-form-label">Size: </label>
                                                <input name="size" type="text" class="form-control" id="size" value="">                                           
                                            </div>
                                            <select name="colorid" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                <option selected>Choose Color</option>
                                                <c:forEach items="${listcl}" var="cl">
                                                    <option value="${cl.colorid}">${cl.colorname}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="form-group">
                                                <label for="amount" class="col-form-label">Quantity: </label>
                                                <input name="amount" type="text" class="form-control" id="amount" value="">                                           
                                            </div>

                                            <input name="page" type="hidden" value="${param.page}">
                                            <input name="orderby" type="hidden" value="${param.orderby}">
                                            <input name="ascdesc" type="hidden" value="${param.ascdesc}">  
                                            <input name="searchkey" type="hidden" value="${param.searchkey}">
                                            <input name="searchfield" type="hidden" value="${param.searchfield}">

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeAdd()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropAdd">
                                            Add
                                        </button>
                                    </div>  

                                    <script>
                                        function closeAdd() {
                                            $('#exampleModal').modal('hide');
                                        }
                                    </script>
                                </div>
                            </div>
                        </div>


                        <div class="modal fade" id="exampleModalEdit" tabindex="0" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit Inventory</h5>
                                        <button type="button" onclick="closeAdd()" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form id="form-edit-inventory" action="${pageContext.request.contextPath}/admin/inventory/edit" method="get">
                                            <div class="form-group">
                                                <label for="piid" class="col-form-label">PIID: </label>
                                                <input name="piid" readonly class="form-control" id="piid" value="${param.piid}">
                                            </div>

                                            <div class="form-group">
                                                <label for="amount" class="col-form-label">Quantity: </label>
                                                <input name="amount" type="text" class="form-control" id="amount" value="${param.amount}">                                           
                                            </div>

                                            <input name="page" type="hidden" value="${param.page}">
                                            <input name="orderby" type="hidden" value="${param.orderby}">
                                            <input name="ascdesc" type="hidden" value="${param.ascdesc}">  
                                            <input name="searchkey" type="hidden" value="${param.searchkey}">
                                            <input name="searchfield" type="hidden" value="${param.searchfield}">

                                            <input name="submit" type="hidden" class="form-control" value="true">
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" onclick="closeEdit()" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdropEdit">
                                            Edit
                                        </button>
                                    </div>  
                                    <script>
                                        function closeEdit() {
                                            $('#exampleModalEdit').modal('hide');
                                        }
                                    </script>
                                    <c:if test = "${param.openEdit == 'true'}">
                                        <script type="text/javascript">
                                            $(window).on('load', function () {
                                                $('#exampleModalEdit').modal('show');
                                            });
                                        </script>
                                    </c:if> 
                                </div>
                            </div>
                        </div>                   





                        <!-- Button trigger modal -->
                        <!-- Modal -->
                        <div class="modal fade" id="staticBackdropAdd" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Add confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-add-inventory" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="staticBackdropEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Edit confirm</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Are you sure?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>                                            
                                        <button class="btn btn-primary" type="submit" form="form-edit-inventory" value="Submit">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:when>
                    <c:when test = "${tittle == 'brand'}"> 
                        <table class="table table-responsive table-borderless">
                            <thead>
                                <tr class="bg-light">
                                    <th scope="col" >#BrandID</th>
                                    <th scope="col" >Brand Name</th>
                                    <th scope="col" ></th>                            
                                    <th scope="col" class="text-end"><span>Edit</span></th>
                                </tr>
                            </thead>    
                            <tbody>
                            <caption>Management ${tittle}</caption>
                            <c:forEach items="${brand}" var="brand">
                                <tr>
                                    <td>${brand.brandid}</td>
                                    <td>${brand.brandname}</td>
                                    <td><a href="${pageContext.request.contextPath}/admin/brand?delete=true&brandid=${brand.brandid}">Delete</a></td>
                                    <td class="text-end"><span class="fw-bolder" ><a href="${pageContext.request.contextPath}/admin/brand?edit=true&brandid=${brand.brandid}&brandname=${brand.brandname}">Edit</a> </span> <i class="fa fa-ellipsis-h ms-2"></i></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>    
                        <c:choose>
                            <c:when test = "${edit == 'true'}">
                                <div class="input-group flex-nowrap">
                                    <form class="submit-edit" autocomplete="off" method="post">
                                        <div id="focus"></div>
                                        <h1>Edit</h1>
                                        <label for="brandid">Brand ID:</label><br><input id="brandname" readonly class="form-control" aria-label="Username" aria-describedby="addon-wrapping" name="editbrandid" type="text" value="${param.brandid}" autocomplete="off">
                                        <br><br>
                                        <label for="brandname">Brand Name:</label><br><input id="brandname" class="form-control" aria-label="Username" aria-describedby="addon-wrapping" name="editbrandname" type="text" value="${param.brandname}" autocomplete="off">                              
                                        <br><br>
                                        <input name="submit" type="hidden" value="true" autocomplete="off">
                                        <div class="input-group mb-3">
                                            <button class="btn btn-outline-secondary" type="submit" form="submit-edit" id="button-addon2">Submit</button>
                                        </div>

                                </div> 
                                </form> 
                                <br>
                            </div>


                            <form id="exit-edit" autocomplete="off">
                                <input id="edit" name="edit" type="hidden" value="false" autocomplete="off">                                  
                            </form> 

                            <div class="input-group mb-3">
                                <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">                                
                                <button class="btn btn-outline-secondary" type="submit" form="exit-edit" id="button-addon2">Exit edit</button>
                            </div>



                        </c:when>
                        <c:when test = "${edit == 'false'}">
                            <p>${errorEditBrand}</p>
                        </form> 
                        <form id="edit" autocomplete="off">
                            <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">
                            <br><br>            
                        </form> 

                        <div class="input-group mb-3">
                            <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">                                
                            <button class="btn btn-outline-secondary" type="submit" form="edit" id="button-addon2">Edit</button>
                        </div>
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
                    </c:when>
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test = "${add == 'true'}">
                        <form class="add" autocomplete="off" method="post">
                            <div id="focus"></div>
                            <h1>Add</h1>
                            <br><br>
                            <label for="addbrandname">Brand Name:</label><br><input id="brandname" name="addbrandname" type="text" placeholder="Brand" autocomplete="off">                              
                            <br><br>
                            <input name="submitadd" type="hidden" value="true" autocomplete="off">
                            <input type="submit" value="Send it">       
                        </form> 
                        <br>
                        <form class="exit" autocomplete="off">
                            <input id="add" name="add" type="hidden" value="false" autocomplete="off">
                            <input type="submit" value="Exit add"> 
                        </form> 
                    </c:when>

                    <c:when test = "${add == 'false'}">
                        <p>${errorEditBrand}</p>

                        <form class="exit" autocomplete="off">
                            <input id="add" name="add" type="hidden" value="true" autocomplete="off">
                            <br><br>
                            <input type="submit" value="Add"> 
                        </form> 
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
                    </c:when>   
                    <c:otherwise>

                    </c:otherwise>
                </c:choose>

                <c:choose>
                    <c:when test = "${delete == 'true'}">
                        <form class="add" autocomplete="off" method="post">
                            <div id="focus"></div>
                            <h1>Delete Brand Not Used With 0 Product - 0 Order - 0 Cart</h1>
                            <p style:color="red";>${errorDeleteBrand}</p>
                            <br><br>
                            <label for="deletebrandid">Brand ID:</label><br><input id="brandname" name="deletebrandid" type="text" value="${param.brandid}" autocomplete="off">                              
                            <br><br>
                            <input name="submitdelete" type="hidden" value="true" autocomplete="off">
                            <input type="submit" value="Send it">       
                        </form> 
                        <br>
                        <form class="exit" autocomplete="off">
                            <input id="delete" name="delete" type="hidden" value="false" autocomplete="off">
                            <input type="submit" value="Exit Delete"> 
                        </form> 
                    </c:when>

                    <c:when test = "${delete == 'false'}">
                        <p>${errorEditBrand}</p>
                    </form> 
                    <form class="exit" autocomplete="off">
                        <input id="delete" name="delete" type="hidden" value="true" autocomplete="off">
                        <br><br>
                        <input type="submit" value="Delete"> 
                    </form> 
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
                </c:when>   

                <c:otherwise>

                </c:otherwise>
            </c:choose>



        </c:when>



        <c:when test = "${tittle == 'color'}"> 
            <table class="table table-responsive table-borderless">
                <thead>
                    <tr class="bg-light">
                        <th scope="col" >#ColorID</th>
                        <th scope="col" >Color Name</th>

                        <th scope="col" ></th>                            
                    </tr>
                </thead>    
                <tbody>
                <caption>Management ${tittle}</caption>
                <c:forEach items="${color}" var="color">
                    <tr>
                        <td>${color.colorid}</td>
                        <td>${color.colorname}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>    

            <c:choose>
                <c:when test = "${edit == 'true'}">
                    <form class="edit" autocomplete="off" method="post">
                        <div id="focus"></div>
                        <h1>Edit</h1>

                        <label for="colorid">Color ID:</label><br><input id="colorid" name="editcolorid" type="text" value="${param.colorid}" autocomplete="off">
                        <br><br>
                        <label for="colorname">Color Name:</label><br><input id="colorname" name="editcolorname" type="text" value="${param.colorname}" autocomplete="off">                              
                        <br><br>
                        <input name="submit" type="hidden" value="true" autocomplete="off">
                        <input type="submit" value="Send it">       
                    </form> 
                    <br>
                    <form class="exit" autocomplete="off">
                        <input id="edit" name="edit" type="hidden" value="false" autocomplete="off">
                        <input type="submit" value="Exit edit"> 
                    </form> 
                </c:when>

                <c:when test = "${edit == 'false'}">
                    <p style="color:red;">${errorEditColor}</p>
                </form> 
                <form class="exit" autocomplete="off">
                    <input id="edit" name="edit" type="hidden" value="true" autocomplete="off">
                    <br><br>
                    <input type="submit" value="Edit"> 
                </form> 

                <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
            </c:when>

            <c:otherwise>
                Edit
            </c:otherwise>
        </c:choose>

        <c:choose>
            <c:when test = "${add == 'true'}">
                <form class="add" autocomplete="off" method="post">
                    <div id="focus"></div>
                    <h1>Add</h1>

                    <br><br>
                    <label for="addcolorname">Color Name:</label><br><input id="addcolorname" name="addcolorname" type="text" placeholder="Color" autocomplete="off">                              
                    <br><br>
                    <input name="submitadd" type="hidden" value="true" autocomplete="off">
                    <input type="submit" value="Send it">       
                </form> 
                <br>
                <form class="exit" autocomplete="off">
                    <input id="add" name="add" type="hidden" value="false" autocomplete="off">
                    <input type="submit" value="Exit add"> 
                </form> 
            </c:when>

            <c:when test = "${add == 'false'}">
                <p style="color:red;">${errorAddColor}</p>
            </form> 
            <form class="exit" autocomplete="off">
                <input id="add" name="add" type="hidden" value="true" autocomplete="off">
                <br><br>
                <input type="submit" value="Add"> 
            </form> 
            <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
        </c:when>   
        <c:otherwise>

        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test = "${delete == 'true'}">
            <form class="add" autocomplete="off" method="post">
                <div id="focus"></div>
                <h1>Delete</h1>
                <p>Delete Color Not Used With 0 Product - 0 Order - 0 Cart</p>
                <p style="color:red;";>${errorDeleteColor}</p>
                <br><br>
                <label for="deletecolorid">COLOR ID:</label><br><input id="colorid" name="deletecolorid" type="text" value="${param.colorid}" autocomplete="off">                              
                <br><br>
                <input name="submitdelete" type="hidden" value="true" autocomplete="off">
                <input type="submit" value="Send it">       
            </form> 
            <br>
            <form class="exit" autocomplete="off">
                <input id="delete" name="delete" type="hidden" value="false" autocomplete="off">
                <input type="submit" value="Exit Delete"> 
            </form> 
        </c:when>

        <c:when test = "${delete == 'false'}">
            <p>${errorEditColor}</p>
        </form> 
        <form class="exit" autocomplete="off">
            <input id="delete" name="delete" type="hidden" value="true" autocomplete="off">
            <br><br>
            <input type="submit" value="Delete"> 
        </form> 
        <link rel="stylesheet" href="${pageContext.request.contextPath}/js/form.js">
    </c:when>





    <c:otherwise>

    </c:otherwise>
</c:choose>     

</c:when>
<c:when test = "${tittle == 'logsomething'}"> 
    <div class="mb-2 d-flex justify-content-between align-items-center">
        <div class="position-relative">

            <table class="table table-responsive table-borderless">
                <thead>
                    <tr class="bg-light">      
                        <th scope="col" >#ID</th>
                        <th scope="col" >Col1</th>
                        <th scope="col" >Col2</th>
                        <th scope="col" >Col3</th>                               
                        <th scope="col" >Col4</th>
                        <th scope="col" >Col5</th>
                        <th scope="col" >Col6</th>
                        <th scope="col" >Col7</th>
                        <th scope="col" >Col8</th>
                        <th scope="col" >Col9</th>
                        <th scope="col" >Col10</th>
                    </tr>
                </thead>
                <tbody>
                <caption>Management ${tittle} - Showing ${totalShow} of ${totalLog}</caption>

                <c:forEach items="${listL}" var="log">
                    <tr>
                        <td>${log.logid}</td>
                        <td>${log.col1}</td>
                        <td>${log.col2}</td>
                        <td>${log.col3}</td>
                        <td>${log.col4}</td>
                        <td>${log.col5}</td>
                        <td>${log.col6}</td>
                        <td>${log.col7}</td>
                        <td>${log.col8}</td>
                        <td>${log.col9}</td>
                        <td>${log.col10}</td>
                    </tr>           
                </c:forEach>  


                </tbody>
            </table>

            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${param.page == 1 || param.page == null || param.page == '' ? 'disabled':''}" >
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/logsomething?page=${param.page-1}" tabindex="-1">Previous</a>
                    </li>

                    <c:forEach var = "i" begin = "1" end = "${totalPage}">
                        <li class="page-item ${i == param.page ? 'active':''}"><a class="page-link" href="${pageContext.request.contextPath}/admin/logsomething?page=${i}">${i}</a></li>                                   
                        </c:forEach>

                    <li class="page-item ${param.page == totalPage ? 'disabled':''}" >
                        <a class="page-link" href="${pageContext.request.contextPath}/admin/logsomething?page=${param.page+1}">Next</a>
                    </li>
                </ul>
            </nav>


        </c:when>

        <c:otherwise>
        </c:otherwise>


    </c:choose>



















</div>
</div>

</body>
</html>
