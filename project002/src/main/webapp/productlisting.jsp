<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tag" tagdir="/WEB-INF/tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 7]><html class="ie ie7"><![endif]-->
<!--[if IE 8]><html class="ie ie8"><![endif]-->
<!--[if IE 9]><html class="ie ie9"><![endif]-->
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
        <title>Sky - Product Listing</title>
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
    <body class="ps-loading">
        <div class="header--sidebar"></div>
        <%@include file="/header.jsp" %>
        <div class="header-services">
            <div class="ps-services owl-slider" data-owl-auto="true" data-owl-loop="true" data-owl-speed="7000" data-owl-gap="0" data-owl-nav="true" data-owl-dots="false" data-owl-item="1" data-owl-item-xs="1" data-owl-item-sm="1" data-owl-item-md="1" data-owl-item-lg="1" data-owl-duration="1000" data-owl-mousedrag="on">
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order with Sky Store</p>
            </div>
        </div>
        <main class="ps-main">
            <div class="ps-products-wrap pt-80 pb-80">
                <div class="ps-products" data-mh="product-listing">
                    <div class="ps-product-action">
                        <div class="ps-product__filter">
                            <select onchange="myFunction1()" id="SelectOption" class="ps-select selectpicker">
                                <option value="1">Sort by</option>
                                <option value="pid1">PID</option>
                                <option value="pid2">PID (decrease)</option>
                                <option value="price1">Price (Low to High)</option>
                                <option value="price2">Price (High to Low)</option>
                            </select>
                            <script>
                                function myFunction1() {
                                    d = document.getElementById("SelectOption").value;

                                    let url = new URL(location.href);
                                    url.searchParams.delete('orderby');
                                    url.searchParams.delete('ascdesc');

                                    const check = url.toString();

                                    if (check.includes("?")) {
                                        if (d == "pid1") {
                                            url += "&orderby=" + "pid" + "&ascdesc=" + "asc";
                                        }
                                        if (d == "pid2") {
                                            url += "&orderby=" + "pid" + "&ascdesc=" + "desc";
                                        }
                                        if (d == "price1") {
                                            url += "&orderby=" + "price" + "&ascdesc=" + "asc";
                                        }
                                        if (d == "price2") {
                                            url += "&orderby=" + "price" + "&ascdesc=" + "desc";
                                        }
                                    } else {
                                        if (d == "pid1") {
                                            url += "?orderby=" + "pid" + "&ascdesc=" + "asc";
                                        }
                                        if (d == "pid2") {
                                            url += "?orderby=" + "pid" + "&ascdesc=" + "desc";
                                        }
                                        if (d == "price1") {
                                            url += "?orderby=" + "price" + "&ascdesc=" + "asc";
                                        }
                                        if (d == "price2") {
                                            url += "?orderby=" + "price" + "&ascdesc=" + "desc";
                                        }
                                    }
                                    window.location.href = url;


                                }
                            </script>
                        </div>



                        <div class="ps-pagination">
                            <ul class="pagination">
                                <li><a href="#"><i class="fa fa-angle-left"></i></a></li>
                                        <c:forEach var = "i" begin = "1" end = "${pageNumber}">
                                            <c:url var="myURL" value="./listing">
                                                <c:if test = "${param.brandid > 0 && param.brandid != '' && param.brandid != null}">
                                                    <c:param name="brandid" value="${param.brandid}"/>
                                                </c:if> 
                                                <c:if test = "${param.colorid > 0 && param.colorid != '' && param.colorid != null}">
                                                    <c:param name="colorid" value="${param.colorid}"/>
                                                </c:if>  

                                        <c:if test = "${param.size > 0 && param.size != '' && param.size != null}">
                                            <c:param name="size" value="${param.size}"/>
                                        </c:if>  

                                        <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                            <c:param name="price1" value="${param.price1}"/>
                                            <c:param name="price2" value="${param.price2}"/>
                                        </c:if> 

                                        <c:param name="page" value="${i}"/>
                                    </c:url>
                                    <li><a href="${myURL}">${i}</a></li>
                                    </c:forEach>
                                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="ps-product__columns">

                        <p> Total ${pageNumber} page. Show ${count2} of ${count1}</p>

                        <c:forEach items="${listP}" var="o">
                            <div class="ps-product__column">
                                <div class="ps-shoe mb-30">
                                    <div class="ps-shoe__thumbnail"><a class="ps-shoe__favorite" href="#"><i class="ps-icon-heart"></i></a><img src="${o.image_link}" alt="" width="500" height="375"><a class="ps-shoe__overlay" href='productdetail?pid=${o.pid}'></a>
                                    </div>
                                    <div class="ps-shoe__content">                      
                                        <div class="ps-shoe__detail"><a class="ps-shoe__name" href="#">${o.name}</a>
                                            <p class="ps-shoe__categories"><a href="#"> ${o.brandname}</a></p><span class="ps-shoe__price"> $ ${o.price}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>


                </div>
                <div class="ps-sidebar" data-mh="product-listing">
                    <aside class="ps-widget--sidebar ps-widget--category">
                        <div class="ps-widget__header">
                            <h3>Brand</h3>
                        </div>
                        <div class="ps-widget__content">
                            <ul class="ps-list--checked">

                                <c:url var="myURL" value="./listing">
                                    <c:param name="brandid" value="0"/>

                                    <c:if test = "${param.colorid > 0 && param.colorid != '' && param.colorid != null}">
                                        <c:param name="colorid" value="${param.colorid}"/>
                                    </c:if>  

                                    <c:if test = "${param.size > 0 && param.size != '' && param.size != null}">
                                        <c:param name="size" value="${param.size}"/>
                                    </c:if>  

                                    <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                        <c:param name="price1" value="${param.price1}"/>
                                        <c:param name="price2" value="${param.price2}"/>
                                    </c:if> 

                                    <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                        <c:param name="page" value="${param.page}"/>     
                                    </c:if> 

                                </c:url>

                                <c:choose>
                                    <c:when test = "${param.brandid == 0 || param.brandid == '' || param.brandid == null}">
                                        <li class="current"><a class="current" href="${myURL}" >All</a></li>                                            </c:when>
                                        <c:when test = "${param.brandid != 0}">
                                        <li ><a class="current" href="${myURL}" >All</a></li>                                            </c:when>
                                        <c:otherwise>
                                        </c:otherwise>
                                    </c:choose>


                                <c:forEach items="${listbr}" var = "br">
                                    <c:url var="myURL1" value="./listing">                                                                              
                                        <c:param name="brandid" value="${br.brandid}"/>

                                        <c:if test = "${param.colorid > 0 && param.colorid != '' && param.colorid != null}">
                                            <c:param name="colorid" value="${param.colorid}"/>
                                        </c:if>  

                                        <c:if test = "${param.size > 0 && param.size != '' && param.size != null}">
                                            <c:param name="size" value="${param.size}"/>
                                        </c:if>     

                                        <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                            <c:param name="price1" value="${param.price1}"/>
                                            <c:param name="price2" value="${param.price2}"/>
                                        </c:if> 

                                        <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                            <c:param name="page" value="${param.page}"/>     
                                        </c:if> 
                                    </c:url>    


                                    <c:choose>
                                        <c:when test = "${param.brandid == br.brandid}">
                                            <li class="current"><a  href="${myURL1}">${br.brandname}</a></li>                                   
                                            </c:when>
                                            <c:when test = "${param.brandid != br.brandid}">
                                            <li><a  href="${myURL1}">${br.brandname}</a></li>                                    
                                            </c:when>
                                            <c:otherwise>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                            </ul>

                        </div>  

                    </aside>





                    <div class="ps-sticky desktop">
                        <aside class="ps-widget--sidebar">
                            <div class="ps-widget__header">
                                <h3>Size</h3>
                            </div>
                            <div class="ps-widget__content">
                                <table class="table ps-table--size">
                                    <tbody>
                                        <c:url var="myURL" value="./listing">
                                            <c:if test = "${param.brandid > 0 && param.brandid != '' && param.brandid != null}">
                                                <c:param name="brandid" value="${param.brandid}"/>
                                            </c:if>  

                                            <c:if test = "${param.colorid > 0 && param.colorid != '' && param.colorid != null}">
                                                <c:param name="colorid" value="${param.colorid}"/>
                                            </c:if>  

                                            <c:param name="size" value="0"/>

                                            <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                <c:param name="price1" value="${param.price1}"/>
                                                <c:param name="price2" value="${param.price2}"/>
                                            </c:if> 

                                            <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                <c:param name="page" value="${param.page}"/>     
                                            </c:if> 
                                        </c:url>
                                        <tr>  <c:choose>
                                                <c:when test = "${param.size == 0 || param.size == '' || param.size == null}">
                                                    <td class="active"><a  href="${myURL}">All</a></td>
                                                </c:when>

                                                <c:when test = "${param.size != 0}">
                                                    <td ><a  href="${myURL}">All</a></td>
                                                </c:when>
                                            </c:choose>

                                            <c:forEach items="${listSize}" var = "size">   

                                                <c:url var="myURL1" value="./listing">
                                                    <c:if test = "${param.brandid > 0 && param.brandid != '' && param.brandid != null}">
                                                        <c:param name="brandid" value="${param.brandid}"/>
                                                    </c:if>  

                                                    <c:if test = "${param.colorid > 0 && param.colorid != '' && param.colorid != null}">
                                                        <c:param name="colorid" value="${param.colorid}"/>
                                                    </c:if>  

                                                    <c:param name="size" value="${size}"/>

                                                    <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                        <c:param name="price1" value="${param.price1}"/>
                                                        <c:param name="price2" value="${param.price2}"/>
                                                    </c:if> 

                                                    <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                        <c:param name="page" value="${param.page}"/>     
                                                    </c:if> 
                                                </c:url>

                                                <c:choose>
                                                    <c:when test = "${param.size == size}">
                                                        <td class="active"><a  href="${myURL1}">${size}</a></td>
                                                        </c:when>
                                                        <c:when test = "${param.size != size}">
                                                        <td><a  href="${myURL1}">${size}</a></td>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach> 
                                        </tr>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </aside>

                        <aside class="ps-widget--sidebar ps-widget--filter">
                            <div class="ps-widget__header">
                                <h3>Price</h3>
                            </div>
                            <div class="ps-widget__content">
                                <div id="price" class="ac-slider" data-default-min="50" data-default-max="1000" data-max="50000" data-step="50" data-unit="$"></div>
                                <p class="ac-slider__meta">Price:<span id="price-min" class="ac-slider__value ac-slider__min"></span>-<span id="price-max" class="ac-slider__value ac-slider__max"></span></p>
                                <a class="ac-slider__filter ps-btn" onclick="myFunction()">Filter </a>


                                <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

                                <p id="demo"></p>

                                <script>
                                    function myFunction() {

                                        const span1 = document.getElementById('price-min');
                                        const span2 = document.getElementById('price-max');
                                        const min = span1.textContent.replace("$", "");
                                        const max = span2.textContent.replace("$", "");
                                        let url = new URL(location.href);
                                        url.searchParams.delete('price1');
                                        url.searchParams.delete('price2');


                                        const check = url.toString();


                                        if (check.includes("?")) {
                                            url += "&price1=" + min + "&price2=" + max;
                                        } else {
                                            url += "?price1=" + min + "&price2=" + max;
                                        }
                                        window.location.href = url;
                                    }
                                </script>
                            </div>
                        </aside>
                        <!--    -->
                        <aside class="ps-widget--sidebar">
                            <div class="ps-widget__header">
                                <h3>Color</h3>
                            </div>
                            <div class="ps-widget__content">
                                <table class="table ps-table--size">
                                    <tbody>
                                        <c:url var="myURL" value="./listing">
                                            <c:if test = "${param.brandid > 0 && param.brandid != '' && param.brandid != null}">
                                                <c:param name="brandid" value="${param.brandid}"/>
                                            </c:if>  

                                            <c:param name="colorid" value="0"/>

                                            <c:if test = "${param.size > 0 && param.size != '' && param.size != null}">
                                                <c:param name="size" value="${param.size}"/>
                                            </c:if>

                                            <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                <c:param name="price1" value="${param.price1}"/>
                                                <c:param name="price2" value="${param.price2}"/>
                                            </c:if> 

                                            <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                <c:param name="page" value="${param.page}"/>     
                                            </c:if> 
                                        </c:url>
                                        <c:choose>
                                            <c:when test = "${param.colorid == 0 || param.colorid == '' || param.colorid == null}">
                                                <tr><td class="active" "><a href="${myURL}">All</a></td></tr>
                                            </c:when>

                                            <c:when test = "${param.colorid != 0}">
                                                <tr> <td ><a  href="${myURL}">All</a></td></tr>
                                            </c:when>
                                        </c:choose>

                                        <c:forEach items="${listColor}" var = "color">   

                                            <c:url var="myURL1" value="./listing">
                                                <c:if test = "${param.brandid > 0 && param.brandid != '' && param.brandid != null}">
                                                    <c:param name="brandid" value="${param.brandid}"/>
                                                </c:if>  

                                                <c:param name="colorid" value="${color.colorid}"/>

                                                <c:if test = "${param.size > 0 && param.size != '' && param.size != null}">
                                                    <c:param name="size" value="${param.size}"/>
                                                </c:if>  

                                                <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                    <c:param name="price1" value="${param.price1}"/>
                                                    <c:param name="price2" value="${param.price2}"/>
                                                </c:if> 

                                                <c:if test = "${(param.price1 >= 0 && param.price2 > 0) && param.price1 != '' && param.price1 != null  && param.price2 != '' && param.price2 != null}">
                                                    <c:param name="page" value="${param.page}"/>     
                                                </c:if> 
                                            </c:url>

                                            <c:choose>
                                                <c:when test = "${param.colorid == color.colorid}">
                                                    <tr> <td class="active"><a href="${myURL1}">${color.colorname}</a></td></tr>
                                                        </c:when>

                                                <c:when test = "${param.colorid != color.colorid}">
                                                    <tr><td><a  href="${myURL1}">${color.colorname}</a></td></tr>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach> 

                                    </tbody>
                                </table>
                            </div>
                        </aside>



                    </div>
                    <!--aside.ps-widget--sidebar-->
                    <!--    .ps-widget__header: h3 Ads Banner-->
                    <!--    .ps-widget__content-->
                    <!--        a(href='product-listing'): img(src="images/offer/sidebar.jpg" alt="")-->
                    <!---->
                    <!--aside.ps-widget--sidebar-->
                    <!--    .ps-widget__header: h3 Best Seller-->
                    <!--    .ps-widget__content-->
                    <!--        - for (var i = 0; i < 3; i ++)-->
                    <!--            .ps-shoe--sidebar-->
                    <!--                .ps-shoe__thumbnail-->
                    <!--                    a(href='#')-->
                    <!--                    img(src="images/shoe/sidebar/"+(i+1)+".jpg" alt="")-->
                    <!--                .ps-shoe__content-->
                    <!--                    if i == 1-->
                    <!--                        a(href='#').ps-shoe__title Nike Flight Bonafide-->
                    <!--                    else if i == 2-->
                    <!--                        a(href='#').ps-shoe__title Nike Sock Dart QS-->
                    <!--                    else-->
                    <!--                        a(href='#').ps-shoe__title Men's Sky-->
                    <!--                    p <del> £253.00</del> £152.00-->
                    <!--                    a(href='#').ps-btn PURCHASE-->
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