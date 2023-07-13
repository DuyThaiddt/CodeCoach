<%-- 
    Document   : FAQ
    Created on : May 28, 2023, 11:15:58 AM
    Author     : giang
--%>

<%@page import="java.util.List"%>
<%@page import="model.Faq"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>FAQ</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body class="account-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->

        <div class="main-wrapper">
            <div class="content">
                <h1 style="font-weight: bold; text-align: center;">Frequently Asked Questions</h1>
                <br>
                <br>
                <div class="account-box">              
                    <div class="login-right">
<<<<<<< HEAD

=======
>>>>>>> upstream/master
                        <div class="accordion" id="accordionExample">
                            <c:forEach items="${listFaq}" var="o">
                                <div class="accordion-item">
                                <h2 class="accordion-header" id="heading${o.getId()}">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${o.getId()}" aria-expanded="false" aria-controls="collapse${o.getId()}">
                                        <strong>${o.getQuestion()}</strong>
                                    </button>
                                </h2>
                                <div id="collapse${o.getId()}" class="accordion-collapse collapse" aria-labelledby="heading${o.getId()}" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        ${o.getAnswer()}
                                    </div>
                                </div>
                            </div>  
                            </c:forEach>                                                 
                        </div>
                    </div>
                </div>
            </div>


            <script src="assets/js/jquery-3.6.0.min.js"></script>

            <script src="assets/js/bootstrap.bundle.min.js"></script>

            <script src="assets/js/script.js"></script>
    </body>
    <!-- end of Pre footer -->
    <%@include file="footer.jsp" %>
    <!-- footer is place here -->
</html>
