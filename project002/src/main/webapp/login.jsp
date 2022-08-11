<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="loginform/css/style.css">

    </head>
    <body class="img js-fullheight" style="background-image: url(loginform/images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Login</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Have an account?</h3>
                            <div class="alert alert-warning" role="alert">
                                ${mess}
                                </div>
                                <form action="" class="signin-form" method="post">
                                    <div class="form-group">
                                        <input name="username" type="text" class="form-control" placeholder="Username" required>
                                    </div>
                                    <div class="form-group">
                                        <input name="password" id="password-field" type="password" class="form-control" placeholder="Password" required>
                                        <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                    </div>
                                    <div class="form-group d-md-flex">

                                    </div>
                                </form>



                                <form id="form-regis-user" action="login" method="post">                              
                                    <div class="form-group">
                                        <label for="username" class="col-form-label">Username: </label>
                                        <input name="username" type="text" class="form-control" id="name" value="">
                                    </div>

                                    <div class="form-group">
                                        <label for="password" class="col-form-label">Pass: </label>
                                        <input name="password" type="password" class="form-control" id="pass" value="">
                                    </div>

                                    <div class="form-group">
                                        <label for="repassword" class="col-form-label">Re-Pass: </label>
                                        <input name="repassword" type="password" class="form-control" id="repass" value="">
                                    </div>

                                    <input name="reg" type="hidden" class="form-control" value="true">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign Up</button>
                                </form>
                                <style>#form-regis-user {

                                        display:none;

                                    }</style>

                                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


                                <script>$(document).ready(function () {
                                        $('#formButton').click(function () {
                                            $('#form-regis-user').toggle(500);
                                        });
                                    });</script>

                                <p class="w-100 text-center">&mdash; Or &mdash;</p>

                                <button type="button" id="formButton" class="form-control btn btn-primary submit px-3" >Sign up</button>

                                <div class="social text-center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>


        <script src="loginform/js/jquery.min.js"></script>
        <script src="loginform/js/popper.js"></script>
        <script src="loginform/js/bootstrap.min.js"></script>
        <script src="loginform/js/main.js"></script>
    </body>
</html>

