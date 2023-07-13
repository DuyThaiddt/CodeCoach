<%-- 
    Document   : viewmentorprofle
    Created on : Jun 7, 2023, 11:56:21 AM
    Author     : Duy Thai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>View Mentor Profile</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <body>
        <div class="main-wrapper">

            <!-- Header is placed here -->
            <%@include file="header.jsp" %>
            <!--End of header-->



            <!--content start-->
            <div class="breadcrumb-bar">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-md-12 col-12">
                            <h2 class="breadcrumb-title">Mentor Profile</h2>
                        </div>
                    </div>
                </div>
            </div>


            <div class="content">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10">

                            <div class="card">
                                <div class="card-body">
                                    <div class="mentor-widget">
                                        <div class="user-info-left align-items-center">
                                            <div class="mentor-img d-flex flex-wrap justify-content-center">
                                                <div class="pro-avatar avatar avatar-xxl">
                                                    <img class="avatar-img rounded-circle" src="assets/images/users/${mentorInfo[1]}.png" alt="alt" onerror=this.src="assets/images/users/default.png"/>
                                                </div>
                                                <div class="rating text-center">
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star filled"></i>
                                                    <i class="fas fa-star"></i>
                                                </div>
                                                <div class="mentor-details m-0">
                                                    <p class="user-location m-0"><i class="fas fa-map-marker-alt"> ${mentorInfo[15]}, ${mentorInfo[16]}</i></p>
                                                </div>
                                            </div>
                                            <div class="user-info-cont">
                                                <h4 class="usr-name">${mentorInfo[6]} ${mentorInfo[7]}</h4>
                                                <div class="mentor-action">
                                                    <!--contact start-->
                                                    <p class="mentor-type social-title">Contact Me</p>
                                                    <a href="javascript:void(0)" class="btn-blue">
                                                        <i class="fas fa-comments"></i>
                                                    </a>
                                                    <a href="mailto:${mentorInfo[4]}" class="btn-blue">
                                                        <i class="fas fa-envelope"></i>
                                                    </a>
                                                    <a href="https://${mentorInfo[14]}" class="btn-blue" data-toggle="modal"
                                                       data-target="#voice_call">
                                                        <i class="fas fa-phone-alt"></i>
                                                    </a>
                                                    <!--contact end-->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="user-info-right d-flex align-items-end flex-wrap">
                                            <div class="hireme-btn text-center">
                                                <span class="hire-rate">${mentor.hourlyRate}VND/Hour</span>
                                                <a class="blue-btn-radius" href="book?mentor-id=${mentor.mentorId}&user-id=${mentor.userId}&skill=${expertiseList[0][3]}">Hire Me</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget about-widget custom-about mb-0">
                                        <h4 class="widget-title">About Me</h4>
                                        <hr />
                                        <p>${mentor.bio}</p>
                                    </div>

                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body custom-border-card pb-0">
                                    <!--personal details start-->
                                    <div class="widget education-widget mb-0">
                                        <h4 class="widget-title">Personal Details</h4>
                                        <hr />
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Gender</span>
                                                            <div class="row-result">${mentorInfo[8]}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Email address</span>
                                                            <div class="row-result">${mentorInfo[4]}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="experience-content">
                                                        <div class="timeline-content">
                                                            <span>Phone number</span>
                                                            <div class="row-result">${mentorInfo[9]}</div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!--personal details end-->
                                </div>
                            </div>

                            <!--expertise start-->
                            <div class="card">
                                <div class="card-body pb-1 custom-border-card">

                                    <div class="widget awards-widget m-0">
                                        <h4 class="widget-title">Expertise</h4>
                                        <hr />
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <c:forEach items="${expertiseList}" var="ex">
                                                    <li>
                                                        <div class="experience-content">
                                                            <div class="timeline-content">
                                                                <div class="row-result">${ex[3]}</div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--expertise end-->

                            <!--experience start-->
                            <div class="card">
                                <div class="card-body custom-border-card pb-0">

                                    <div class="widget experience-widget mb-0">
                                        <h4 class="widget-title">Experience</h4>
                                        <hr />
                                        <div class="experience-box">
                                            <ul class="experience-list profile-custom-list">
                                                <c:forEach items="${experienceList}" var="e">
                                                    <li>
                                                        <div class="experience-content">

                                                            <div class="row-result">${e.description}</div>

                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!--experience end-->

                        </div>
                    </div>
                </div>
            </div>
            <!--content end-->


            <!-- end of Pre footer -->
            <%@include file="footer.jsp" %>
            <!-- footer is place here -->

        </div>
        <script data-cfasync="false" src="../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="assets/js/jquery-3.6.0.min.js"></script>

        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/script.js"></script>
    </body>
</html>
