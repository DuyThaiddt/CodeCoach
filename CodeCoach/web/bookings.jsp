<%-- 
    Document   : viewbooking
    Created on : Jun 12, 2023, 9:54:34 PM
    Author     : MrTuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>CodeCoach</title>

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">

        <link rel="stylesheet" href="assets/plugins/aos/aos.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <script defer src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    </head>
    <body>


        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="header.jsp" %>
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
                                <c:forEach items="${requestScope.userInf}" var="user">
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
                                </c:forEach>
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
                                        <li><a href="bookings-mentee.html" class="active"><i class="fas fa-clock"></i>Bookings <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="chat-mentee.html"><i class="fas fa-comments"></i>Messages <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="favourites.html"><i class="fas fa-star"></i>Favourites <span><i class="fas fa-chevron-right"></i></span></a></li>
                                        <li><a href="profile-mentee.html"><i class="fas fa-user-cog"></i>Profile <span><i class="fas fa-chevron-right"></i></span></a></li>
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
                                                        <th>MENTOR LISTS</th>
                                                        <th>HOURLY RATE</th>
                                                        <th class="text-center">ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${requestScope.listMentor}" var="m">
                                                        <tr>
                                                            <td>
                                                                <h2 class="table-avatar">
                                                                    <a href="profile.html" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="assets/img/user/user2.jpg" alt="User Image"></a>
                                                                    <a href="profile.html">${m.getUsers().getfName()} ${m.getUsers().getlName()}<span><span class="__cf_email__" data-cfemail="f5818c879a9b90879a9790878186b594919a9790db969a98">${m.getUsers().getEmail()}</span></span></a>
                                                                </h2>
                                                            </td>
                                                            <td>${m.getHourlyRate()}</td>
                                                            <td class="text-center"><button onclick="getDetailMentorById(${m.userId})" name="id" value="${m.userId}" class="btn btn-sm bg-info-light"><i class="far fa-eye"></i> View</button></td>
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
            <%@include file="footer.jsp" %>
            <!-- Footer end -->

        </div>
        <script type="text/javascript">
            function getDetailMentorById(id) {
                window.location.href = "/codecoach/profile?id=" + id;
            }
        </script>

        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/owl.carousel.min.js"></script>

        <script src="assets/plugins/aos/aos.js"></script>

        <script src="assets/js/script.js"></script>
    </body>

</html>
