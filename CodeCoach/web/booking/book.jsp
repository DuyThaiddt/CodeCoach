<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="model.Users" %>
<%@ page import="dal.TinhThanhPhoDAO" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:02 GMT -->

<head>
  <meta charset="utf-8">
  <title>Mentoring</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

  <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
  <style>
    .tinhthanhpho{
      font-family: "Poppins", Arial, sans-serif;
    }
  </style>
  <script>
    function changeDate() {
      var incrementNumber;
      var ammount = $('#select-range').val();

      if (ammount === "Next week") {
        incrementNumber = 7;
      } else if (ammount === "Next 2 week") {
        incrementNumber = 14;
      } else if (ammount === "Next 3 week") {
        incrementNumber = 21;
      } else if (ammount === "Next 4 week") {
        incrementNumber = 28;
      } else if (ammount === "This week") {
        incrementNumber = 0;
      }

      $.ajax({
        url: '${pageContext.request.contextPath}/book',
        data: {
          "startDate": ${startDate.getYear() + 1900} + "/" + ${startDate.getMonth() + 1} + "/" + ${startDate.getDate() + incrementNumber},
          "incrementNumber": incrementNumber,
          "go": "changeDate"
        },
        cache: false,
        type: "POST",
        success: function(data) {
          var container = document.getElementById("slotContainer");
          container.innerHTML = data;
          $('#proceed-btn').css('display', 'none');
          $('#slotForm').css('display', 'none');
        },
        error: function(xhr) {

        }
      });
    }
  </script>
  <script>
    function changeSlot(){
      var incrementNumber;
      var ammount = $('#select-range').val();

      if (ammount === "Next week") {
        incrementNumber = 7;
      } else if (ammount === "Next 2 week") {
        incrementNumber = 14;
      } else if (ammount === "Next 3 week") {
        incrementNumber = 21;
      } else if (ammount === "Next 4 week") {
        incrementNumber = 28;
      } else if (ammount === "This week") {
        incrementNumber = 0;
      }
      $.ajax({
        url: '${pageContext.request.contextPath}/book',
        data: {
          "startDate": ${startDate.getYear() + 1900} + "/" + ${startDate.getMonth() + 1} + "/" + ${startDate.getDate() + incrementNumber},
          "incrementNumber": incrementNumber,
          "go": "changeSlotDate",
          "mentorId": ${mentorId},
          "skill" : "${skill}",
          "userId" : "${userId}"
        },
        cache: false,
        type: "POST",
        success: function(data) {
          var container = document.getElementById("slotForm");
          container.innerHTML = data;
          $('#slotForm').css('display', 'block');
        },
        error: function(xhr) {

        }
      });
    }
  </script>

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
              <li class="breadcrumb-item active" aria-current="page">Booking</li>
            </ol>
          </nav>
          <h2 class="breadcrumb-title">Booking</h2>
        </div>
      </div>
    </div>
  </div>

  <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="currentDate" />
  <fmt:formatDate value="${now}" pattern="EEEE" var="dayOfWeek" />
  <%
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    Calendar calendar = Calendar.getInstance();

    calendar.setTime((Date) request.getAttribute("startDate"));
    request.setAttribute("mon", dateFormat.format(calendar.getTime()));
    calendar.add(Calendar.DATE, 1);
    request.setAttribute("tue", dateFormat.format(calendar.getTime()));
    calendar.add(Calendar.DATE, 1);
    request.setAttribute("wed", dateFormat.format(calendar.getTime()));
    calendar.add(Calendar.DATE, 1);
    request.setAttribute("thu", dateFormat.format(calendar.getTime()));
    calendar.add(Calendar.DATE, 1);
    request.setAttribute("fri", dateFormat.format(calendar.getTime()));
    calendar.add(Calendar.DATE, 1);
    request.setAttribute("sat", dateFormat.format(calendar.getTime()));
    calendar.add(Calendar.DATE, 1);
    request.setAttribute("sun", dateFormat.format(calendar.getTime()));
  %>


  <div class="content">
    <div class="container-fluid">
      <div class="row">
        <div class="col-12">
          <div class="card">
            <div class="card-body">
              <div class="booking-user-info">
                <a href="profile.html" class="booking-user-img">
                  <img src="assets/img/user/user2.jpg" alt="User Image">
                </a>
                <div class="booking-info">
                  <h4><a href="profile.html">${users.lName} ${users.fName}</a></h4>
                  <p class="text-muted mb-0"><i class="fas fa-map-marker-alt"></i><%=new TinhThanhPhoDAO().getTTPNameAndQHName(((Users) session.getAttribute("users")).getUserId())%>

                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12 col-sm-4 col-md-6">
              <h4 class="mb-1">${currentDate}</h4>
              <p class="text-muted">${dayOfWeek}</p>
            </div>
            <div class="col-12 col-sm-8 col-md-6 text-sm-end">
              <select name="select-range" id="select-range" onchange="changeDate()">
                <option value="This week">This week</option>
                <option value="Next week">Next week</option>
                <option value="Next 2 week">Next 2 week</option>
                <option value="Next 3 week">Next 3 week</option>
                <option value="Next 4 week">Next 4 week</option>
              </select>
            </div>

          </div>

          <div class="row">
            <button type="button" class="proceed-btn mx-auto" onclick="changeSlot()">Confirm</button>
          </div>

          <div class="card booking-schedule schedule-widget">

            <div class="schedule-header">
              <div class="row">
                <div class="col-md-12">

                  <div class="day-slot">
                    <div id="slotContainer">
                      <ul>
                        <li class="left-arrow">
                          <a href>
                            <i class="fa fa-chevron-left"></i>
                          </a>
                        </li>
                        <li>
                          <span>Mon</span>
                          <span id="slot-date-mon">${mon}</span>
                        </li>
                        <li>
                          <span>Tue</span>
                          <span id="slot-date-tue">${tue}</span>
                        </li>
                        <li>
                          <span>Wed</span>
                          <span id="slot-date-wed">${wed}</span>
                        </li>
                        <li>
                          <span>Thu</span>
                          <span id="slot-date-thu">${thu}</span>
                        </li>
                        <li>
                          <span>Fri</span>
                          <span id="slot-date-fri">${fri}</span>
                        </li>
                        <li>
                          <span>Sat</span>
                          <span id="slot-date-sat">${sat}</span>
                        </li>
                        <li>
                          <span>Sun</span>
                          <span class="slot-date-sun">${sun}</span>
                        </li>
                        <li class="right-arrow">
                          <a href>
                            <i class="fa fa-chevron-right"></i>
                          </a>
                        </li>
                      </ul>
                    </div>
                  </div>

                </div>
              </div>
            </div>


            <div id="slotForm">
              <form action="book" method="post">
                <input type="hidden" name="go" value="book-time">
                <input type="hidden" name="userId" value="${users.userId}">
                <input type="hidden" name="mentor-id" value="${mentorId}">
                <input type="hidden" name="skill" value="${skill}">
                <div class="schedule-cont">
                  <div class="row">
                    <div class="col-md-12">

                      <div class="time-slot">
                        <ul class="clearfix">
                          <li>
                            <%--                          1,08:00:00,10:00:00--%>
                            <%--                          2,10:00:00,12:00:00--%>
                            <%--                          3,13:00:00,15:00:00--%>
                            <%--                          4,15:00:00,17:00:00--%>
                            <%--                          5,17:00:00,19:00:00--%>
                            <%--                          6,19:00:00,21:00:00--%>
                            <%--                          7,21:00:00,23:00:00--%>

                            <input type="checkbox" name="mon-1" id="mon-1" value="${mon}">
                            <label for="mon-1">8:00 - 10:00 AM</label>

                            <input type="checkbox" name="mon-2" id="mon-2" value="${mon}">
                            <label for="mon-2">10:00 - 12:00 PM</label>

                            <input type="checkbox" name="mon-3" id="mon-3" value="${mon}">
                            <label for="mon-3">1:00 - 3:00 PM</label>

                            <input type="checkbox" name="mon-4" id="mon-4" value="${mon}">
                            <label for="mon-4">3:00 - 5:00 PM</label>

                            <input type="checkbox" name="mon-5" id="mon-5" value="${mon}">
                            <label for="mon-5">5:00 - 7:00 PM</label>

                            <input type="checkbox" name="mon-6" id="mon-6" value="${mon}">
                            <label for="mon-6">7:00 - 9:00 PM</label>

                            <input type="checkbox" name="mon-7" id="mon-7" value="${mon}">
                            <label for="mon-7">9:00 - 11:00 PM</label>

                          </li>
                          <li>

                            <input type="checkbox" name="tue-1" id="tue-1" value="${tue}">
                            <label for="tue-1">8:00 - 10:00 AM</label>

                            <input type="checkbox" name="tue-2" id="tue-2" value="${tue}">
                            <label for="tue-2">10:00 - 12:00 PM</label>

                            <input type="checkbox" name="tue-3" id="tue-3" value="${tue}">
                            <label for="tue-3">1:00 - 3:00 PM</label>

                            <input type="checkbox" name="tue-4" id="tue-4" value="${tue}">
                            <label for="tue-4">3:00 - 5:00 PM</label>

                            <input type="checkbox" name="tue-5" id="tue-5" value="${tue}">
                            <label for="tue-5">5:00 - 7:00 PM</label>

                            <input type="checkbox" name="tue-6" id="tue-6" value="${tue}">
                            <label for="tue-6">7:00 - 9:00 PM</label>

                            <input type="checkbox" name="tue-7" id="tue-7" value="${tue}">
                            <label for="tue-7">9:00 - 11:00 PM</label>


                          </li>
                          <li>

                            <input type="checkbox" name="wed-1" id="wed-1" value="${wed}">
                            <label for="wed-1">8:00 - 10:00 AM</label>

                            <input type="checkbox" name="wed-2" id="wed-2" value="${wed}">
                            <label for="wed-2">10:00 - 12:00 PM</label>

                            <input type="checkbox" name="wed-3" id="wed-3" value="${wed}">
                            <label for="wed-3">1:00 - 3:00 PM</label>

                            <input type="checkbox" name="wed-4" id="wed-4" value="${wed}">
                            <label for="wed-4">3:00 - 5:00 PM</label>

                            <input type="checkbox" name="wed-5" id="wed-5" value="${wed}">
                            <label for="wed-5">5:00 - 7:00 PM</label>

                            <input type="checkbox" name="wed-6" id="wed-6" value="${wed}">
                            <label for="wed-6">7:00 - 9:00 PM</label>

                            <input type="checkbox" name="wed-7" id="wed-7" value="${wed}">
                            <label for="wed-7">9:00 - 11:00 PM</label>


                          </li>
                          <li>

                            <input type="checkbox" name="thu-1" id="thu-1" value="${thu}">
                            <label for="thu-1">8:00 - 10:00 AM</label>

                            <input type="checkbox" name="thu-2" id="thu-2" value="${thu}">
                            <label for="thu-2">10:00 - 12:00 PM</label>

                            <input type="checkbox" name="thu-3" id="thu-3" value="${thu}">
                            <label for="thu-3">1:00 - 3:00 PM</label>

                            <input type="checkbox" name="thu-4" id="thu-4" value="${thu}">
                            <label for="thu-4">3:00 - 5:00 PM</label>

                            <input type="checkbox" name="thu-5" id="thu-5" value="${thu}">
                            <label for="thu-5">5:00 - 7:00 PM</label>

                            <input type="checkbox" name="thu-6" id="thu-6" value="${thu}">
                            <label for="thu-6">7:00 - 9:00 PM</label>

                            <input type="checkbox" name="thu-7" id="thu-7" value="${thu}">
                            <label for="thu-7">9:00 - 11:00 PM</label>


                          </li>
                          <li>

                            <input type="checkbox" name="fri-1" id="fri-1" value="${fri}">
                            <label for="fri-1">8:00 - 10:00 AM</label>

                            <input type="checkbox" name="fri-2" id="fri-2" value="${fri}">
                            <label for="fri-2">10:00 - 12:00 PM</label>

                            <input type="checkbox" name="fri-3" id="fri-3" value="${fri}">
                            <label for="fri-3">1:00 - 3:00 PM</label>

                            <input type="checkbox" name="fri-4" id="fri-4" value="${fri}">
                            <label for="fri-4">3:00 - 5:00 PM</label>

                            <input type="checkbox" name="fri-5" id="fri-5" value="${fri}">
                            <label for="fri-5">5:00 - 7:00 PM</label>

                            <input type="checkbox" name="fri-6" id="fri-6" value="${fri}">
                            <label for="fri-6">7:00 - 9:00 PM</label>

                            <input type="checkbox" name="fri-7" id="fri-7" value="${fri}">
                            <label for="fri-7">9:00 - 11:00 PM</label>

                          </li>
                          <li>

                            <input type="checkbox" name="sat-1" id="sat-1" value="${sat}">
                            <label for="sat-1">8:00 - 10:00 AM</label>

                            <input type="checkbox" name="sat-2" id="sat-2" value="${sat}">
                            <label for="sat-2">10:00 - 12:00 PM</label>

                            <input type="checkbox" name="sat-3" id="sat-3" value="${sat}">
                            <label for="sat-3">1:00 - 3:00 PM</label>

                            <input type="checkbox" name="sat-4" id="sat-4" value="${sat}">
                            <label for="sat-4">3:00 - 5:00 PM</label>

                            <input type="checkbox" name="sat-5" id="sat-5" value="${sat}">
                            <label for="sat-5">5:00 - 7:00 PM</label>

                            <input type="checkbox" name="sat-6" id="sat-6" value="${sat}">
                            <label for="sat-6">7:00 - 9:00 PM</label>

                            <input type="checkbox" name="sat-7" id="sat-7" value="${sat}">
                            <label for="sat-7">9:00 - 11:00 PM</label>


                          </li>
                          <li>

                            <input type="checkbox" name="sun-1" id="sun-1" value="${sun}">
                            <label for="sun-1">8:00 - 10:00 AM</label>

                            <input type="checkbox" name="sun-2" id="sun-2" value="${sun}">
                            <label for="sun-2">10:00 - 12:00 PM</label>

                            <input type="checkbox" name="sun-3" id="sun-3" value="${sun}">
                            <label for="sun-3">1:00 - 3:00 PM</label>

                            <input type="checkbox" name="sun-4" id="sun-4" value="${sun}">
                            <label for="sun-4">3:00 - 5:00 PM</label>

                            <input type="checkbox" name="sun-5" id="sun-5" value="${sun}">
                            <label for="sun-5">5:00 - 7:00 PM</label>

                            <input type="checkbox" name="sun-6" id="sun-6" value="${sun}">
                            <label for="sun-6">7:00 - 9:00 PM</label>

                            <input type="checkbox" name="sun-7" id="sun-7" value="${sun}">
                            <label for="sun-7">9:00 - 11:00 PM</label>


                          </li>
                        </ul>
                      </div>

                    </div>
                  </div>
                </div>



                <div id="proceed-btn" class="submit-section proceed-btn text-end">
                    <button type="submit" class="btn btn-primary submit-btn">Proceed to Pay</button>
                </div>
              </form>
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
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

</body>

<!-- Mirrored from mentoring.dreamguystech.com/html/template/booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 14 May 2023 10:33:03 GMT -->

</html>
