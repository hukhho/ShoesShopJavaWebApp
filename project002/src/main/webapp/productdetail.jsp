<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>



<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <link href="apple-touch-icon.png" rel="apple-touch-icon">
        <link href="favicon.png" rel="icon">
        <meta name="author" content="">
        <meta name="keywords" content="Default Description">
        <meta name="description" content="Default keyword">
        <title>Product Detail</title>
        <!-- Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Archivo+Narrow:300,400,700%7CMontserrat:300,400,500,600,700,800,900" rel="stylesheet">
        <link rel="stylesheet" href="plugins/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="plugins/ps-icon/style.css">
        <!-- CSS Library-->
        <link rel="stylesheet" href="plugins/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="plugins/owl-carousel/assets/owl.carousel.css">
        <link rel="stylesheet" href="plugins/jquery-bar-rating/dist/themes/fontawesome-stars.css">
        <link rel="stylesheet" href="plugins/slick/slick/slick.css">
        <link rel="stylesheet" href="plugins/bootstrap-select/dist/css/bootstrap-select.min.css">
        <link rel="stylesheet" href="plugins/Magnific-Popup/dist/magnific-popup.css">
        <link rel="stylesheet" href="plugins/jquery-ui/jquery-ui.min.css">
        <link rel="stylesheet" href="plugins/revolution/css/settings.css">
        <link rel="stylesheet" href="plugins/revolution/css/layers.css">
        <link rel="stylesheet" href="plugins/revolution/css/navigation.css">
        <!-- Custom-->
        <link rel="stylesheet" href="css/style.css">
        <!--HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
        <!--WARNING: Respond.js doesn't work if you view the page via file://-->
        <!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <!--[if IE 7]><body class="ie7 lt-ie8 lt-ie9 lt-ie10"><![endif]-->
    <!--[if IE 8]><body class="ie8 lt-ie9 lt-ie10"><![endif]-->
    <!--[if IE 9]><body class="ie9 lt-ie10"><![endif]-->
    <body class="ps-loading" onload="selectColor()">
        <div class="header--sidebar"></div>

        <%@include file="/header.jsp" %>

        <div class="header-services">
            <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
            </div>
        </div>
        <main class="ps-main">
            <div class="test">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 ">
                        </div>
                    </div>
                </div>
            </div>
            
            <h1 style="color:blue;">${errorInventory}</h1>
            
            <div class="ps-product--detail pt-60">

                <div class="ps-container">
                    <div class="row">

                        <div class="col-lg-10 col-md-12 col-lg-offset-1">
                            
                            <c:forEach items="${listfullbypid}" var="o" begin="0" end="0"> 
                                <div class="ps-product__thumbnail">
                                    <div class="ps-product__preview">
                                        <div class="ps-product__variants">
                                            <div class="item"><img src="${o.image_link}" alt=""></div>

                                        </div>


                                    </div>
                                    <div class="ps-product__image">
                                        <div class="item"><img class="zoom" src="${o.image_link}" alt="" data-zoom-image="${o.image_link}"></div>
                                    </div>
                                </div>
                                <div class="ps-product__thumbnail--mobile">
                                    <div class="ps-product__main-img"><img src="${o.image_link}" alt=""></div>
                                    <div class="ps-product__preview owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="5000" data-owl-gap="20" data-owl-nav="true" data-owl-dots="false" data-owl-item="3" data-owl-item-xs="3" data-owl-item-sm="3" data-owl-item-md="3" data-owl-item-lg="3" data-owl-duration="1000" data-owl-mousedrag="on"><img src="${o.image_link}" alt=""></div>
                                </div>
                            </c:forEach> 


                            <div class="ps-product__info">


                                <c:forEach items="${listfullbypid}" var="o" begin="0" end="0">             

                                    <h1>${o.name}</h1>                                        

                                    <p class="ps-product__category"><a href="#">${o.brandname}</a></p>

                                    <h3 class="ps-product__price">${o.price}<del>${o.price*2}</del></h3>

                                </c:forEach> 









                                <div class="ps-product__block ps-product__quickview">
                                    <h4>QUICK REVIEW</h4>
                                    <%-- 
                                                                        <c:forEach items="${listfullbypid}" var="o">
                                                                            <p>PIID: ${o.piid}</p>
                                                                            <p>Size: ${o.size}</p>
                                                                            
                                                                        </c:forEach>
                                    --%>
                                    <c:forEach items="${listfullbypid}" var="o" begin="0" end="0">                                       
                                        <p>Review: ${o.review}</p>
                                    </c:forEach>           




                                </div>



                                <div class="ps-product__block ps-product__size">
                                    <h4>CHOOSE SIZE AND COLOR<a href="#">Size</a></h4>

                                    <form action="./cart1/add" method="post">

                                        <c:forEach items="${listfullbypid}" var="o" begin="0" end="0">                                       
                                            <input id="pid" name="pid" type="hidden" value="${o.pid}">
                                        </c:forEach>         

                                        <script type="text/javascript">
                                            function update() {
                                                var select = document.getElementById('chooseColor');
                                                var option = select.options[select.selectedIndex];

                                                document.getElementById('text').value = option.text;
                                                window.location.href = "productdetail?pid=" + document.getElementById('pid').value + "&chooseColor=" + document.getElementById('text').value;
                                            }
                                            function selectColor() {
                                                document.getElementById("chooseColor").value = document.getElementById('colorPara').value;
                                            }
                                            update();
                                            selectColor();
                                        </script>

                                        <input id="colorPara" name="colorPara" type="hidden" value="${param.chooseColor}">

                                        <input type="hidden" id="text">


                                        <select id="chooseColor" name="colorname" class="ps-select selectpicker" onChange="update()">
                                            <option value="">Select Color</option>                                                      
                                            <c:forEach items="${color}" var="c"> 
                                                <c:choose>

                                                    <c:when test = "${param.chooseColor == c.colorname}">
                                                        <option value="${c.colorname}" selected>${c.colorname}</option>
                                                    </c:when>

                                                    <c:when test = "${param.chooseColor != c.colorname}">
                                                        <option value="${c.colorname}">${c.colorname}</option>
                                                    </c:when>

                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>  
                                        </select>






                                        <select name="size" class="ps-select selectpicker">
                                            <option value="">Select Size </option>

                                            <c:forEach items="${listsize}" var="size">
                                                <option value="${size}">${size}</option>
                                            </c:forEach> 
                                        </select>




                                        <div class="form-group">
                                            <input name="amount" class="form-control" type="number" value="1">
                                        </div>

                                        <input class="ps-btn mb-10" type="submit" value="Add to cart"<i class="ps-icon-next"></i>   


                                        <p style="color:red;" class="text-danger">${param.errorMess}</p>


                                </div>

                                <input id="product" type="hidden" value="${param.pid}">   

                                </form>

                                <a id="compare" class="ac-slider__filter ps-btn" onclick="myFunctionCompare()">Compare </a>
                                <a id="compare" class="ac-slider__filter ps-btn" onclick="myFunctionCompare1()">Clear Compare</a>

                                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

                                <p id="demo"></p>

                                <script>
                                    function myFunctionCompare() {

                                        const product = document.getElementById('product');

                                        let url = new URL(window.location.href.split('?')[0].replace('/productdetail',''));
                                       
                                        var product1 = sessionStorage.getItem('product1');

                                        var product2 = sessionStorage.getItem('product2');

                                        if ((product1 != '' && product1 != null) && (product2 == '' || product2 == null))
                                        {

                                            if (product1 == product.value) {
                                                alert("Product to compare must differrent first product!!!");
                                            } else {
                                                var setsession = window.sessionStorage.setItem("product1", product1);
                                                var setsession = window.sessionStorage.setItem("product2", product.value);
                                            }
                                        }

                                        if (product1 == '' || product1 == null) {

                                            var setsession = window.sessionStorage.setItem("product1", product.value);
                                            alert("Choose Product 1 success! Chooose product 2!");
                                        }

                                        if ((product1 != '' && product1 != null) && (product2 != '' && product2 != null))
                                        {
                                            url += "/compare?pid1=" + product1 + "&pid2=" + product2;
                                            window.location.href = url;                                         
                                        }

                                    }
                                </script>

                                <script>
                                    function myFunctionCompare1() {
                                        sessionStorage.clear();
                                        $("#compare").text("Compare");
                                        alert("Clear success!!");                                         
                                    }
                                </script>


                                <script> $(document).ready(function () {
                                        var product1 = sessionStorage.getItem('product1');

                                        var product2 = sessionStorage.getItem('product2');
                                        
                                        if (product1 != null && product1 != '') {
                                            $("#compare").text("Compare with product id " + product1);
                                        } else {
                                            $("#compare").text("Compare");
                                        }
                                        
                                        
                                        
                                    });</script>


                                <div class="clearfix"></div>
                                <div class="ps-product__content mt-50">
                                    <ul class="tab-list" role="tablist">
                                        <li class="active"><a href="#tab_01" aria-controls="tab_01" role="tab" data-toggle="tab">Amount left in stock</a></li>
                                    </ul>
                                </div>


                                <div class="tab-content mb-60">
                                    <div class="tab-pane active" role="tabpanel" id="tab_01">
                                        <table class="table ps-checkout__products">
                                            <thead>
                                                <tr>
                                                    <th>Size</th>
                                                    <th>Color</th>
                                                    <th>Amount</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach items="${listfullbypid}" var="o">    
                                                    <tr>
                                                        <td>${o.size}</td>
                                                        <td>${o.colorname}</td>
                                                        <td>${o.amount}</td>
                                                    </tr>
                                                </c:forEach>  
                                            </tbody>

                                        </table>




                                    </div>





                                </div>



                            </div>
                        </div>
                    </div>
                </div>


                    <%@include file="/footer.jsp" %>

        </main>
        <!-- JS Library-->
        <script type="text/javascript" src="plugins/jquery/dist/jquery.min.js"></script>
        <script type="text/javascript" src="plugins/bootstrap/dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="plugins/jquery-bar-rating/dist/jquery.barrating.min.js"></script>
        <script type="text/javascript" src="plugins/owl-carousel/owl.carousel.min.js"></script>
        <script type="text/javascript" src="plugins/gmap3.min.js"></script>
        <script type="text/javascript" src="plugins/imagesloaded.pkgd.js"></script>
        <script type="text/javascript" src="plugins/isotope.pkgd.min.js"></script>
        <script type="text/javascript" src="plugins/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" src="plugins/jquery.matchHeight-min.js"></script>
        <script type="text/javascript" src="plugins/slick/slick/slick.min.js"></script>
        <script type="text/javascript" src="plugins/elevatezoom/jquery.elevatezoom.js"></script>
        <script type="text/javascript" src="plugins/Magnific-Popup/dist/jquery.magnific-popup.min.js"></script>
        <script type="text/javascript" src="plugins/jquery-ui/jquery-ui.min.js"></script>
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAx39JFH5nhxze1ZydH-Kl8xXM3OK4fvcg&amp;region=GB"></script><script type="text/javascript" src="plugins/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.video.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script type="text/javascript" src="plugins/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <!-- Custom scripts-->
        <script type="text/javascript" src="js/main.js"></script>
    </body>
</html>