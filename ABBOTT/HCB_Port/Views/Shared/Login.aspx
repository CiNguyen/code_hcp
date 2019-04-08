<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>


<!DOCTYPE html>
<!--Author     : @arboshiki-->
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>Login to LobiAdmin</title>
    <link rel="shortcut icon" href="../../Contents/img/logo/lobiadmin-logo-16.ico" />
    <link href="../../Contents/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../Contents/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../Contents/css/login.css" rel="stylesheet" />
    <link href="../../Contents/css/lobiadmin-with-plugins.css" rel="stylesheet" />
</head>
<body style="background-image: url('../../Contents/img/demo/3_1920.jpg')">
    <div class="login-wrapper fadeInDown animated">
        <form class="lobi-form login-form visible">
            <div class="login-header">
                Login to your account
            </div>
            <div class="login-body no-padding">
                <fieldset>
                    <div class="form-group">
                        <label>Username</label>
                        <label class="input">
                            <span class="input-icon input-icon-prepend fa fa-user"></span>
                            <input type="text" id="username" name="username" placeholder="Username">
                            <span class="tooltip tooltip-top-left"><i class="fa fa-user text-cyan-dark"></i>Please enter the username</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <label class="input">
                            <span class="input-icon input-icon-prepend fa fa-key"></span>
                            <input type="password" id="password" name="password" placeholder="Password">
                            <span class="tooltip tooltip-top-left"><i class="fa fa-key text-cyan-dark"></i>Please enter your password</span>
                        </label>
                        <button type="button" class="btn-link btn-forgot-password">Forgot your password?</button>
                    </div>

                    <div class="row">
                        <div class="col-xs-8">
                            <label class="checkbox lobicheck lobicheck-info lobicheck-inversed lobicheck-lg">
                                <input type="checkbox" name="remember_me" value="0">
                                <i></i>Remember me
                            </label>
                        </div>
                        <div class="col-xs-4">
                            <a href="Javascript:;" onclick="Event_Login();" id="login" class="btn btn-info btn-block"><span class="glyphicon glyphicon-log-in"></span>Login</a>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="login-footer">
                New user?
                <button type="button" class="btn btn-xs btn-info btn-sign-up pull-right">Sign up</button>
            </div>
        </form>
        <!--Sign up form-->
        <form class="lobi-form signup-form">
            <div class="login-header">
                New user? Sign up.
            </div>
            <div class="login-body no-padding">
                <fieldset>
                    <div class="row">
                        <div class="col-xxs-12 col-xs-6">
                            <label>First name</label>
                            <label class="input">
                                <span class="input-icon input-icon-prepend fa fa-user"></span>
                                <input type="text" name="firstname" placeholder="Firstname">
                            </label>
                        </div>
                        <div class="col-xxs-12 col-xs-6">
                            <label>Last name</label>
                            <label class="input">
                                <span class="input-icon input-icon-prepend fa fa-user"></span>
                                <input type="text" name="lastname" placeholder="Lastname">
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Username</label>
                        <label class="input">
                            <span class="input-icon input-icon-prepend fa fa-user"></span>
                            <input type="text" name="username" placeholder="Username">
                        </label>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <label class="input">
                            <span class="input-icon input-icon-prepend fa fa-envelope"></span>
                            <input type="text" name="email" placeholder="Email address">
                        </label>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <label class="input">
                            <span class="input-icon input-icon-prepend fa fa-key"></span>
                            <input type="password" name="password" placeholder="Password">
                        </label>
                    </div>
                    <div class="form-group">
                        <label>Confirm password</label>
                        <label class="input">
                            <span class="input-icon input-icon-prepend fa fa-key"></span>
                            <input type="password" name="confirm_password" placeholder="Confirm password">
                        </label>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 col-xs-offset-8">
                            <button type="submit" class="btn btn-info btn-block">Register</button>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="login-footer">
                Do you already have an account?
                <button type="button" class="btn btn-xs btn-info btn-sign-in pull-right">Sign in</button>
            </div>
        </form>
        <!--Forgot password form-->
        <form class="lobi-form pass-forgot-form">
            <div class="login-header">
                Forgot your password?
            </div>
            <div class="login-body">
                <fieldset>
                    <div class="form-group">
                        <label>Email or username</label>
                        <label class="input">
                            <span class="input-icon input-icon-prepend fa fa-envelope"></span>
                            <span class="input-icon input-icon-append fa fa-user"></span>
                            <input type="text" name="username" placeholder="Email or username">
                            <span class="tooltip tooltip-bottom-right">Type the email or username used for registration</span>
                        </label>
                        <button type="button" class="btn-link btn-sign-in">Remember your password?</button>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 text-right">
                            <button type="submit" class="btn btn-info btn-block"><i class="fa fa-refresh"></i>Restore password</button>
                        </div>
                    </div>
                </fieldset>
            </div>
            <div class="login-footer">
                New user?
                <button type="button" class="btn btn-xs btn-info btn-sign-up pull-right">Sign up</button>
            </div>
        </form>
    </div>

    <script src="../../Contents/js/lib/jquery.min.js"></script>
    <script src="../../Contents/js/lobi-plugins/lobibox.min.js"></script>
    <script src="../../Contents/js/bootstrap/bootstrap.min.js"></script>

    <script type="text/javascript">
        $('.login-wrapper').ready(function () {
            $('.login-form').submit(function () {
                window.location.href = window.location.href + "/../";
                return false;
            });
            $('.signup-form').submit(function () {
                return false;
            });
            $('.pass-forgot-form').submit(function () {
                return false;
            });
        });

        var input = document.getElementById("password");
        input.addEventListener("keyup", function (event) {
            event.preventDefault();
            if (event.keyCode === 13) {
                document.getElementById("login").click();
            }
        });

        $('.btn-forgot-password').click(function (ev) {
            var $form = $(this).closest('form');
            $form.removeClass('visible');
            $form.parent().find('.pass-forgot-form').addClass('visible');
        });
        $('.btn-sign-in').click(function () {
            var $form = $(this).closest('form');
            $form.removeClass('visible');
            $form.parent().find('.login-form').addClass('visible');
        });
        $('.btn-sign-up').click(function () {
            var $form = $(this).closest('form');
            $form.removeClass('visible');
            $form.parent().find('.signup-form').addClass('visible');
        });

        function Event_Login() {
            var user = $("#username").val();
            var pass = $("#password").val();
            $.ajax({
                dataType: 'json',
                contentType: 'application/json; charset=utf-8',
                type: 'POST',
                url: '/Index/Event_Login/?username=' + user + '&password=' + pass,
                success: function (res) {
                    if (res.code == "1") {
                        Lobibox.alert('error', {                          
                            msg: res.msg
                        });
                    }
                    if (res.code == "0") {
                        window.location.href = "/Index/";
                    }
                }
            });
        }
    </script>
</body>
</html>
