<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="model.Slot"%>
<%@page import="model.Skills"%>
<%@page import="model.BookingDetails"%>
<%@page import="model.Mentees"%>
<%@page import="model.Mentors"%>
<%@page import="model.Booking"%>
<%@page import="model.Users"%>
<%@page import="java.util.List"%>
<%@page import="model.ChatRoom"%>
<%@page import="model.ChatMessages"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>List Invoice</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
        <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

        <link rel="stylesheet" href="assets/css/style.css">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }

            table th, table td {
                border: 1px solid black;
                padding: 8px;
                width: calc(100% / 4);
            }
        </style>
    </head>
    <body class="chat-page">
        <!-- Header is placed here -->
        <%@include file="header.jsp" %>
        <!--End of header-->

        <div class="account-box">              
            <div class="login-right">
                <div class="accordion" id="accordionExample">

                    <%  Mentors m = (Mentors) request.getAttribute("m");
                        List<Booking> listBookings = (List<Booking>) request.getAttribute("bookings");
                        List<Users> listUsers = (List<Users>) request.getAttribute("listusers");
                        List<Mentors> listMentors = (List<Mentors>) request.getAttribute("mentors");
                        List<Mentees> listMentees = (List<Mentees>) request.getAttribute("mentees");
                        List<Skills> listSkills = (List<Skills>) request.getAttribute("skills");
                        List<BookingDetails> listBookingDetails = (List<BookingDetails>) request.getAttribute("bookingDetails");
                        List<Slot> listSlots = (List<Slot>) request.getAttribute("slots");
                        %>
                        <table>
                            <tr style="font-size: 40px;">
                                    <th>Mentor Name</th>
                                    <th>Mentee Name</th>
                                    <th>Skill</th>
                                    <th>Invoice</th>
                                </tr>                                   
                            </table>
                    <%
                        for (int i = 0; i < listBookings.size(); i++) {
                            int userId = 0;
                            String fullName = "";
                            String skillName = "";
                    %>
                    <div class="accordion-item">

                        <h2 class="accordion-header" id="<%="heading" + i%>">
                            
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="<%="#collapse" + i%>" aria-expanded="false" aria-controls="<%="collapse" + i%>">                             
                                <table>
                                    <tr>
                                        <th>
                                            <%for (int j = 0; j < listMentors.size(); j++) {
                                                    if (listBookings.get(i).getMentorId() == listMentors.get(j).getMentorId()) {
                                                        userId = listMentors.get(j).getUserId();
                                                    }
                                                }
                                                for (int k = 0; k < listUsers.size(); k++) {
                                                    if (listUsers.get(k).getUserId() == userId) {
                                                        fullName = listUsers.get(k).getfName() + " " + listUsers.get(k).getlName();
                                                    }
                                                }
                                            %>
                                            <%out.print(fullName);%>
                                        </th>
                                        <th>
                                            <%for (int j = 0; j < listMentees.size(); j++) {
                                                    if (listBookings.get(i).getMenteeId() == listMentees.get(j).getMenteeId()) {
                                                        userId = listMentees.get(j).getUserId();
                                                    }
                                                }
                                                for (int k = 0; k < listUsers.size(); k++) {
                                                    if (listUsers.get(k).getUserId() == userId) {
                                                        fullName = listUsers.get(k).getfName() + " " + listUsers.get(k).getlName();
                                                    }
                                                }
                                            %>
                                            <%out.print(fullName);%>
                                        </th>
                                        <th>
                                            <%for (int l = 0; l < listSkills.size(); l++) {
                                                    if (listBookings.get(i).getSkillId() == listSkills.get(l).getSkillId()) {
                                                        skillName = listSkills.get(l).getSkillName();
                                                    }
                                                }
                                            %>
                                            <%out.print(skillName);%>
                                        </th>
                                        <th>
                                            <%int count = 0;
                                                int invoice = 0;
                                                for (int n = 0; n < listBookingDetails.size(); n++) {
                                                    if (listBookingDetails.get(n).getBookingId() == listBookings.get(i).getBookingId()) {
                                                        count = count + 1;
                                                    }
                                                }
                                                invoice = count * Integer.parseInt(m.getHourlyRate()) * 2;
                                            %>
                                            <%out.print(invoice);%>
                                        </th>
                                    </tr>                                   
                                </table>
                            </button>
                        </h2>
                        <div id="<%="collapse" + i%>" class="accordion-collapse collapse" aria-labelledby="<%="heading" + i%>" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <%for (int o = 0; o < listBookingDetails.size(); o++) {
                                        if (listBookingDetails.get(o).getBookingId() == listBookings.get(i).getBookingId()) {
                                %>
                                <table>
                                    <tr>

                                        <th>
                                            <%out.print("Slot " + listBookingDetails.get(o).getSlotId());%>
                                            <%for (int v = 0; v < listSlots.size(); v++) {
                                                    if (listBookingDetails.get(o).getSlotId() == listSlots.get(v).getSlotId()) {
                                                        out.print("("+listSlots.get(v).getStartTime().substring(0, 5) +" - "+listSlots.get(v).getEndTime().substring(0, 5)+")");
                                                    }
                                                }%>
                                        </th>
                                        <th>
                                            <%DateTimeFormatter initialFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                                                LocalDate date = LocalDate.parse(listBookingDetails.get(o).getDate(), initialFormatter);
                                                // ??nh d?ng m?i
                                                DateTimeFormatter newFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
                                                String newDateString = date.format(newFormatter);
                                                out.print(newDateString);
                                            %>
                                        </th>
                                    </tr>
                                </table>
                                <%
                                        }
                                    }%>
                            </div>
                        </div>
                    </div>  
                    <%
                        }
                    %>
                </div>
            </div>
            <%@include file="footer.jsp" %>
        </div>


        <script src="assets/js/jquery-3.6.0.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/script.js"></script>

    </body>
</html>
