<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>My Order</title>
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
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
                <p class="ps-service"><i class="ps-icon-delivery"></i><strong>Free delivery</strong>: Get free standard delivery on every order</p>
            </div>
        </div>


        <main class="ps-main">
            <div class="ps-content pt-80 pb-80">
                <div class="ps-container">
                    <div class="ps-cart-listing">
                        <table class="table ps-cart__table">
                            <thead>
                                <tr>
                                    <th>ID Orders</th>
                                    <th>Date</th>


                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>


                                <c:set var="total" value="${0}"/>

                                <c:forEach items="${orderlist}" var="o">                               
                                    <tr>
                                        <td><a class="ps-product__preview" href="./orderinfo?orderid=${o.orderid}">${o.orderid}</a></td>
                                        <td>${o.orderdate}</td>




                                    </tr>

                                </c:forEach> 




                            </tbody>


                        </table>
                        <div class="ps-cart__actions">


                        </div>
                    </div>
                </div>
            </div>
            <div class="ps-subscribe">
                <div class="ps-container">
                    <div class="row">
                        <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12 ">
                            <h3><i class="fa fa-envelope"></i>Sign up to Newsletter</h3>
                        </div>
                        <div class="col-lg-5 col-md-7 col-sm-12 col-xs-12 ">
                            <form class="ps-subscribe__form" action="do_action" method="post">
                                <input class="form-control" type="text" placeholder="">
                                <button>Sign up now</button>
                            </form>
                        </div>
                        <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12 ">
                            <p>...and receive  <span>$20</span>  coupon for first shopping.</p>
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
