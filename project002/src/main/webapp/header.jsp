<header class="header">
    <div class="header__top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-8 col-sm-6 col-xs-12 ">
                    <c:if test="${not empty usersession}">
                        <p> Hello ${usersession.username}</p>
                    </c:if>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-6 col-xs-12 ">
                    <c:if test="${not empty usersession}">
                        <div class="header__actions"><a href="login?logout=true">Logout</a>
                    </c:if>
                    <c:if test="${not empty usersession}">
                        <div class="header__actions"><a href="#">Cash: ${info1.cash}</a>
                    </c:if>
                    <c:if test="${empty usersession}">
                        <div class="header__actions"><a href="login">Login & Regiser</a>
                    </c:if>    

                    <div class="btn-group ps-dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">USD<i class="fa fa-angle-down"></i></a>
                        <c:if test="${not empty usersession}">
                            <ul class="dropdown-menu">
                                <li><a href="#"><img src="images/flag/usa.svg" alt="">USD</a></li>                                       
                            </ul>
                        </c:if> 
                    </div>
                    <div class="btn-group ps-dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Language<i class="fa fa-angle-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">English</a></li>                   
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<nav class="navigation">
    <div class="container-fluid">
        <div class="navigation__column left">
            <div class="header__logo"><a class="ps-logo" href="./home"><img src="images/sale.png" alt="" width="100" height="70"></a></div>
        </div>
        <div class="navigation__column center">
            <ul class="main-menu menu">
                <li class="menu-item menu-item-has-children dropdown"><a href="./home">Home</a>
                    <ul class="sub-menu">
                        <li class="menu-item"><a href="./home">Homepage</a></li>
                    </ul>
                </li>
                <li class="menu-item menu-item-has-children has-mega-menu"><a href="#">BRAND</a>
                    <div class="mega-menu">
                        <div class="mega-wrap">
                            <div class="mega-column">
                                <h4 class="mega-heading">Brand</h4>
                                <ul class="mega-item">                                                  
                                    <c:forEach items="${listbr}" var="br">
                                        <li><a href="./listing?brandid=${br.brandid}">${br.brandname}</a></li>
                                    </c:forEach>                                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="menu-item"><a href="./listing">Listing</a></li>
                <li class="menu-item"><a href="./cart">Cart</a></li>
                <li class="menu-item"><a href="./order">My Order</a></li>
                <li class="menu-item"><a href="./userinfo">My Info</a></li>
            </ul>
        </div>
        <div class="navigation__column right">
            <form class="ps-search--header" action="./listing" method="get">                              
                <input class="form-control" type="text" name="searchkey" placeholder="Search Product?">            
                <button><i class="ps-icon-search"></i></button>
            </form>
            <c:set var="numberitem" value="${0}"/>
            <c:if test="${not empty usersession}">
                <c:forEach items="${productmap}" var="productmap">
                    <c:set var="numberitem" value="${numberitem + 1}"/>
                </c:forEach> 
            </c:if>   
            <c:set var="total" value="${0}"/>

            <div class="ps-cart"><a class="ps-cart__toggle" href="#"><span><i>${numberitem}</i></span><i class="ps-icon-shopping-cart"></i></a>
                <div class="ps-cart__listing">

                    <div class="ps-cart__content">                                     
                        <c:if test="${not empty usersession}">
                            <c:forEach items="${productmap}" var="productmap">  
                                <div class="ps-cart-item"><a class="ps-cart-item__close" href="#"></a>
                                    <div class="ps-cart-item__thumbnail"><a href="./productdetail?pid=${productmap.value.pid}"></a><img src="${productmap.value.image_link}" alt="" width="50" height="30"></div>
                                    <div class="ps-cart-item__content"><a class="ps-cart-item__title" href="./productdetail?pid=${productmap.value.pid}">${productmap.value.name} - ${productmap.value.colorname} - ${productmap.value.size}</a>
                                        <p><span>Quantity:<i>${productmap.key.quantity}</i></span><span>Total:<i>${productmap.key.quantity*productmap.value.price}</i></span></p>

                                        <c:set var="total" value="${total + productmap.key.quantity*productmap.value.price}" />
                                    </div>
                                </div>
                            </c:forEach> 
                        </c:if>
                    </div>

                    <div class="ps-cart__total">
                        <p>Number of items:<span>${numberitem}</span></p>
                        <p>Item Total:<span>${total}</span></p>
                    </div>
                    <div class="ps-cart__footer"><a class="ps-btn" href="./cart">Check out<i class="ps-icon-arrow-left"></i></a></div>
                </div>
            </div>
            <div class="menu-toggle"><span></span></div>
        </div>
    </div>
</nav>
</header>