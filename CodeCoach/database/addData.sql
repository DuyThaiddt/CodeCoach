-- Insert data into UserStatus table
INSERT INTO UserStatus (statusName)
VALUES
  ('Active'),
  ('Unverified'),
  ('Locked');

-- Insert data into Roles table
INSERT INTO Roles (roleName)
VALUES
  ('Admin'),
  ('Mentor'),
  ('Mentee');

-- Insert data into Users table
INSERT INTO Users (email, password, fName, lName, gender, phoneNum, roleId, statusId, address, maqh, facebook)
VALUES
  ('admin@admin.com','123456' , 'Admin', 'User', 'Male', '123456', 1, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/'),
  ('mentor@mentor.com','123456', 'Mentor', 'User', 'Male', '234567', 2, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/'),
  ('mentee@mentee.com','123456', 'Mentee', 'User', 'Male', '345678', 3, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/'),
  ('thaiddhe176315@fpt.edu.vn','123456', N'Đào', N'Duy Thái', 'Male', '0796428094', 2, 1, 'FPT', '276', 'www.facebook.com/duythai.ddt/');

-- Insert data into Categories table
INSERT INTO Categories (categoryName) VALUES
('Web Development'),
('Mobile Development'),
('Database Administration'),
('Programming Languages'),
('Data Science and Analytics');

-- Insert data into SubCategories table
INSERT INTO Subcategories (CategoryId, subCategoryName) VALUES
(1, 'Front-end Development'),
(1, 'Back-end Development'),
(1, 'Full-stack Development'),
(2, 'iOS Development'),
(2, 'Android Development'),
(3, 'SQL Server'),
(3, 'Oracle Database'),
(3, 'MySQL'),
(4, 'Java'),
(4, 'Python'),
(4, 'C++'),
(5, 'Machine Learning'),
(5, 'Big Data Analytics');

-- Insert data into Skills table
INSERT INTO Skills (skillName, subCategoryId)
VALUES
  ('HTML', 1),
  ('CSS', 1),
  ('JavaScript', 1),
  ('Node.js', 2),
  ('Express.js', 2),
  ('React.js', 1),
  ('React Native', 2),
  ('iOS Development', 4),
  ('Android Development', 5),
  ('SQL Server', 6),
  ('Oracle Database', 7),
  ('MySQL', 8),
  ('Java', 9),
  ('Python', 10),
  ('C++', 11),
  ('Machine Learning', 12),
  ('Big Data Analytics', 13),
   ('PHP', 1),
  ('ASP.NET', 2),
  ('Swift', 4),
  ('Kotlin', 5),
  ('MongoDB', 3),
  ('PostgreSQL', 3),
  ('Ruby', 4),
  ('R', 5),
  ('Go', 6),
  ('TensorFlow', 5);

  -- Insert data into Mentors table
INSERT INTO Mentors (userId, bio, hourlyRate)
VALUES
  (2, 'I am really good at Java and Python', 450000),
  (4, 'I am expert at React and NodeJS', 500000);

  -- Insert data into Experience table
  INSERT INTO Experience (mentorId, description)
VALUES
  (1, 'Worked as a Java developer for 5 years'),
  (2, 'Developed Python applications for various clients');

  -- Insert data into Expertise table
  INSERT INTO Expertise (mentorId, skillId)
VALUES
  (1, 13),
  (1, 14),
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4),
  (2, 5),
  (2, 6),
  (2, 12),
  (2, 22);

  -- Insert data into Mentees table
INSERT INTO Mentees (userId)
VALUES
  (3);

  -- Insert data into MenteeInterests table
INSERT INTO MenteeInterests (menteeId, skillId, categoryId, subCategoryId)
VALUES
  (1, 3, 2, 3);

  -- Insert data into Slot table
INSERT INTO Slot (startTime, endTime)
VALUES
  ('08:00', '10:00'),
  ('10:00', '12:00'),
  ('13:00', '15:00'),
  ('15:00', '17:00'),
  ('17:00', '19:00'),
  ('19:00', '21:00'),
  ('21:00', '23:00');

  -- Insert data into Booking table
INSERT INTO Booking (mentorId, menteeId, skillId, status)
VALUES
  (1, 1, 13, 'Accepted'),
  (1, 1, 14, 'Pending'),
  (2, 1, 1, 'Accepted'),
  (2, 1, 2, 'Rejected'),
  (2, 1, 3, 'Pending');

  -- Insert data into BookingDetails table
INSERT INTO BookingDetails (bookingId, slotId, date)
VALUES
  (1, 1, '2023-05-01'),
  (2, 2, '2023-05-03'),
  (3, 3, '2023-05-05'),
  (4, 3, '2023-05-06'),
  (5, 3, '2023-05-06');

  -- Insert data into Feedback table
INSERT INTO Feedback (menteeId, mentorId, bookingId, rating, reviewText, reviewDateTime)
VALUES
  (1, 1, 1, 5, 'Great mentor!', GETDATE());

  -- Insert data into Notifications table
INSERT INTO Notifications (userId, bookingId, content, dateTime, type, status)
VALUES
  (1, 1, 'New booking request', GETDATE(), 'Booking', 'Pending');

  -- Insert data into ChatRoom table
INSERT INTO ChatRoom (chatRoomName)
VALUES
  ('General Chat'),
  ('Mentors Chat'),
  ('Mentees Chat');


  -- Insert data into ChatRoomUsers table
INSERT INTO ChatRoomUsers (chatRoomId, userId)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 2),
  (3, 1),
  (3, 3);

  
-- Insert data into ChatMessages table
INSERT INTO ChatMessages (chatRoomId, userId, message, sentDateTime)
VALUES
  (1, 1, 'Hello everyone!', GETDATE()),
  (1, 2, 'Hi there!', GETDATE());

  -- Insert data into FAQ table
  INSERT INTO FAQ (question, answer) VALUES ('How do I register and create a tutor account on this website?', 'Back to home page. Then click on the "Register" button in the upper right corner of the screen.');
INSERT INTO FAQ (question, answer) VALUES ('How do I search and select a tutor that fits my needs?', 'Visit the homepage. drag the vertical scroll bar down 1/3 of the page. You will see the most popular mentors.');
INSERT INTO FAQ (question, answer) VALUES ('How can I view detailed information about a specific tutor, including their experience, qualifications, teaching fees, ratings from other students, etc.?', 'Click on the tutor avatar or name. The information you are interested in will appear.');
INSERT INTO FAQ (question, answer) VALUES ('Does the tutor guarantee teaching quality? Do they have any relevant qualifications or certifications?', 'Every mentor on our website has been rigorously tested. So you can rest assured trust in our mentor.');
INSERT INTO FAQ (question, answer) VALUES ('What are the conditions and policies for canceling scheduled lessons?', 'You can cancel your class before the first lesson then you will get 50% of your tuition back. If you have already started studying you will no longer be able to cancel.');
INSERT INTO FAQ (question, answer) VALUES ('Does the website provide customer support or assistance? How can I contact them?', 'Please click on the "Contact us" section at the bottom right of the homepage to be able to contact us');

-- Insert data into PrivacyPolicyAndTerms

INSERT INTO PrivacyPolicyAndTerms VALUES(1, 1, 'Collection of Personal Information','When registering for our tutoring system, we may collect personal information such as your name, email address, contact number, and educational background. We may also collect additional information related to your tutoring preferences and requirements. All personal information collected will be kept confidential and will only be used for the purpose of providing tutoring services.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(2, 1, 'Use of Personal Information','The personal information we collect will be used to match you with suitable tutors based on your preferences and requirements. We may use your contact information to communicate with you regarding tutoring services, schedule changes, or other relevant information. Your personal information may be used to improve our services and tailor them to better meet your needs.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(3, 1, 'Protection of Personal Information','We are committed to ensuring the security of your personal information and have implemented appropriate measures to protect it from unauthorized access, disclosure, alteration, or destruction. We use industry-standard security protocols to safeguard your personal information during transmission and storage. Access to your personal information is limited to authorized personnel who require it to provide tutoring services.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(4, 1, 'Disclosure of Personal Information','We do not sell, trade, or rent your personal information to third parties for marketing purposes. However, we may disclose your personal information to tutors or educational institutions when necessary for the purpose of arranging tutoring sessions or fulfilling tutoring requests.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(5, 1, 'Cookies and Tracking Technologies','We may use cookies and similar tracking technologies to enhance your browsing experience on our website. These technologies may collect information such as your IP address, browser type, and browsing patterns, but do not personally identify you. You have the option to disable cookies in your browser settings, although this may affect your ability to use certain features of our website.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(6, 1, 'Third-Party Links','Our website may contain links to third-party websites or services that are not under our control. We are not responsible for the privacy practices or content of these third-party sites. We encourage you to review the privacy policies of these websites before providing any personal information.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(1, 2, 'User Responsibilities','By registering for our tutoring system, you agree to provide accurate and up-to-date information about yourself. You are responsible for maintaining the confidentiality of your account credentials and for any activity that occurs under your account. You agree to use the tutoring services provided through our system for lawful purposes only and not to engage in any fraudulent, abusive, or harmful activities.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(2, 2, 'Tutoring Services','Our tutoring services aim to connect students with qualified tutors based on their preferences and requirements. We strive to match students with tutors who best fit their needs; however, we do not guarantee the availability or suitability of any specific tutor. The scheduling and payment terms for tutoring sessions will be agreed upon between the student and the tutor directly.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(3, 2, 'Intellectual Property','All intellectual property rights, including copyrights and trademarks, related to our tutoring system and website content, belong to us or our licensors. You may not reproduce, modify, distribute, or use any of our intellectual property without prior written permission.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(4, 2, 'Limitation of Liability','We strive to provide accurate and reliable information; however, we do not warrant the completeness, accuracy, or reliability of any information on our website or provided through our tutoring system. We are not liable for any direct, indirect, incidental, or consequential damages resulting from the use or inability to use our tutoring services or any information obtained from our website.'); 
INSERT INTO PrivacyPolicyAndTerms VALUES(5, 2, 'Amendments','We reserve the right to modify or update this Privacy Policy and Terms and Conditions at any time without prior notice. Any changes to these policies will be effective immediately upon posting on our website. It is your responsibility to review these policies periodically to stay informed of any updates.'); 

INSERT INTO ContactUs (infor, href)
VALUES ('FPT University Thach That, Hanoi, Vietnam', 'https://goo.gl/maps/46NsiFijUrQ5kV1J6'),
       ('+84 79 6428 094', 'tel://1234567920'),
       ('codecoach.project@gmail.com', 'mailto:codecoach.project@gmail.com'),
       ('CodeCoach.com', 'https://codecoach.com');
