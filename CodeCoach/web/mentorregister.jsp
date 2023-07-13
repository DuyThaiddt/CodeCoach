<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from mentoring.dreamguystech.com/html/template/mentor-register.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:32:22 GMT -->
    <head>
        <meta charset="utf-8">
        <title>Mentoring</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="account-page">

        <%@include file="header.jsp" %>
        <div class="main-wrapper">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4 offset-md-4">

                            <div class="account-content">
                                <div class="row align-items-center justify-content-center">
                                    <div class="col-md-12 col-lg-6 login-right">
                                        <div class="login-header">
                                            <h3>Mentor Register <a href="home">Not a Mentor?</a></h3>
                                        </div>

                                        <form action="mentorregister" method="post">  
                                            
                                            <div class="form-group form-focus">        
                                                <textarea type="text" row="3" name="biography" class="form-control floating"></textarea>
                                                <label class="focus-label">Enter your biography</label>
                                            </div>
                                            <div class="form-group form-focus">
                                                <input type="number" name="hourlyRate" class="form-control floating">
                                                <label class="focus-label">Enter number of hourly rate that you want</label>
                                            </div>   
                                            <div class="form-group form-focus">
                                                <input type="text" name="hourlyRate" class="form-control floating">
                                                <label class="focus-label">Enter your description</label>
                                            </div> 
                                            <div class="form-group form-focus">
                                                <input type="text" name="hourlyRate" class="form-control floating">
                                                <label class="focus-label">Enter your skill</label>
                                            </div> 
                                            <div class="form-group form-focus">
                                                <input type="text" name="hourlyRate" class="form-control floating">
                                                <label class="focus-label">Enter your SubCategories</label>
                                            </div> 
                                            <div class="form-group form-focus">
                                                <input type="text" name="hourlyRate" class="form-control floating">
                                                <label class="focus-label">Enter your Categories</label>
                                            </div> 
                                            <div class="text-end">
                                                <a class="forgot-link" href="login">Already have an account?</a>
                                            </div>
                                            <button class="btn btn-primary btn-block btn-lg login-btn" type="submit">Signup</button>
                                            <div class="form-group form-focus">    
                                                <input type="hidden"  value="${users.userId}" readonly="readonly" name="userId" class="form-control floating">
                                               
                                            </div>
                                            <div class="login-or">
                                                <span class="or-line"></span>                                              
                                        </form>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>




        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
    
    <%@include file="footer.jsp" %>
    
</html>