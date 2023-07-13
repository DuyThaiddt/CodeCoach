<%-- 
    Document   : PrivacyPolicyTerms
    Created on : May 28, 2023, 9:22:44 AM
    Author     : giang
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->
        <div class="main-wrapper">
            <div class="content">
                <h1 style="font-weight: bold; text-align: center;">Privacy Policy & Terms</h1>
                <br>
                <br>
                <div class="account-box">              
                    <div class="login-right">
                        <h1>Privacy Policy:</h1>
                        <br>
                        <c:forEach items="${listPpat}" var="o">
                            <c:if test="${o.getType()==1}">
                                <h3>${o.getId()} .${o.getSummary()}</h3>
                                <br>
                                <ul>
                                    <li>${o.getContent()}</li>
                                </ul>
                            </c:if>
                        </c:forEach>
                        <br>
                        <br>
                        <h1>Terms:</h1>
                        <br>
                        <c:forEach items="${listPpat}" var="o">
                            <c:if test="${o.getType()==2}">
                                <h3>${o.getId()} .${o.getSummary()}</h3>
                                <br>
                                <ul>
                                    <li>${o.getContent()}</li>
                                </ul>
                            </c:if>
                        </c:forEach>
                        <br><br>
                    </div>
                </div>
            </div>
            <!-- end of Pre footer -->
            <%@include file="footer.jsp" %>
            <!-- footer is place here -->

            <script src="assets/js/jquery-3.6.0.min.js"></script>

            <script src="assets/js/bootstrap.bundle.min.js"></script>

            <script src="assets/js/script.js"></script>
    </body>

</html>