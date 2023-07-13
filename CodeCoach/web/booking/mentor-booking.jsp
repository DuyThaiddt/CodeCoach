<%-- 
    Document   : viewbooking
    Created on : Jun 12, 2023, 9:54:34 PM
    Author     : MrTuan
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>CodeCoach</title>

        <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/aos/aos.css">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>


        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="../header.jsp" %>
            <!--End of header-->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <nav aria-label="breadcrumb" class="page-breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">My Bookings</li>
                                </ol>
                            </nav>
                            <h2 class="breadcrumb-title">My Bookings</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">

                        <div class="col-md-5 col-lg-4 col-xl-3 theiaStickySidebar">
                            <div class="profile-sidebar">
                                <c:set var="user" value="${requestScope.userInf}" />
                                <div class="user-widget">
                                    <div class="pro-avatar">JD</div>
                                    <div class="rating">
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star filled"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <div class="user-info-cont">
                                        <h4 class="usr-name">${user.getfName()} ${user.getlName()}</h4>
                                        <p class="mentor-type">${user.getAddress()}</p>
                                    </div>
                                </div>

                                <div class="progress-bar-custom">
                                    <h6>Complete your profiles ></h6>
                                    <div class="pro-progress">
                                        <div class="tooltip-toggle" tabindex="0"></div>
                                        <div class="tooltip">80%</div>
                                    </div>
                                </div>
                                <div class="custom-sidebar-nav">
                                    <ul>
                                        <li><a href="dashboard-mentee.html"><i class="fas fa-home"></i>Dashboard <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="/codecoach/viewbooking" class="active"><i class="fas fa-clock"></i>Bookings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="chat-mentee.html"><i class="fas fa-comments"></i>Messages <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="favourites.html"><i class="fas fa-star"></i>Favourites <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="/codecoach/profile"><i class="fas fa-user-cog"></i>Profile <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="login.html"><i class="fas fa-sign-out-alt"></i>Logout <span><i class="fas fa-chevron-right"></i></span></a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>


                        <div class="col-md-7 col-lg-8 col-xl-9">
                            <h3 class="pb-3">Booking Summary</h3>

                            <div class="tab-pane show active" id="mentee-list">
                                <div class="card card-table">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th>MENTEE LISTS</th>
                                                        <th>SCHEDULED DATE</th>
                                                        <th class="text-center">SCHEDULED TIMINGS</th>
                                                        <th class="text-center">ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.mentorBookings}" var="booking">
                                                        <tr>
                                                            <td>
                                                                ${booking.menteeName}
                                                            </td>
                                                            <td>${booking.date}</td>
                                                            <td class="text-center"><span class="pending">${booking.startTime} - ${booking.endTime}</span></td>
                                                            <td class="text-center"><a href="profile-mentee.html" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i>${booking.status}</a></td>
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
                </div>
            </div>
            <!--Footer start-->
            <%@include file="../footer.jsp" %>
            <!-- Footer end -->

        </div>


        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="../assets/js/jquery-3.6.0.min.js"></script>

        <script src="../assets/js/bootstrap.bundle.min.js"></script>

        <script src="../assets/js/owl.carousel.min.js"></script>

        <script src="../assets/plugins/aos/aos.js"></script>

        <script src="../assets/js/script.js"></script>
    </body>
</html>
