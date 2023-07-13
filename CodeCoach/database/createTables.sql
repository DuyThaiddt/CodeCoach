


CREATE TABLE tinhthanhpho (
  mattp varchar(5)  NOT NULL PRIMARY KEY,
  [name] nvarchar(100)  NOT NULL,
  [type] nvarchar(30)  NOT NULL,
) 
CREATE TABLE quanhuyen (
  maqh varchar(5) NOT NULL PRIMARY KEY,
  [name] nvarchar(100) NOT NULL,
  [type] nvarchar(30) NOT NULL,
  mattp varchar(5) NOT NULL FOREIGN KEY REFERENCES tinhthanhpho(mattp)
) 

CREATE TABLE UserStatus (
  statusID INT IDENTITY(1,1) PRIMARY KEY,
  statusName VARCHAR(50) NOT NULL
);

CREATE TABLE Roles (
  roleId INT IDENTITY(1,1) PRIMARY KEY,
  roleName VARCHAR(50) NOT NULL
);

CREATE TABLE Users (
  userId INT IDENTITY(1,1) PRIMARY KEY,
  email VARCHAR(50) NOT NULL,
  [password] varchar(50) NOT NULL, 
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  phoneNum VARCHAR(20) NOT NULL,
  roleId INT NOT NULL,
  statusId INT NOT NULL,
  address VARCHAR(100),
  maqh varchar(5) NOT NULL,
  facebook VARCHAR(100),
  FOREIGN KEY (roleId) REFERENCES Roles(roleId),
  FOREIGN KEY (statusId) REFERENCES UserStatus(statusID),
  FOREIGN KEY (maqh) REFERENCES quanhuyen(maqh)
);


CREATE TABLE Categories (
  categoryId INT IDENTITY(1,1) PRIMARY KEY,
  categoryName VARCHAR(50) NOT NULL,
);

CREATE TABLE SubCategories (
  subCategoryId INT IDENTITY(1,1) PRIMARY KEY,
  categoryId INT NOT NULL,
  subCategoryName VARCHAR(50) NOT NULL,
  FOREIGN KEY (categoryId) REFERENCES Categories(categoryId)
);

CREATE TABLE Skills (
  skillId INT IDENTITY(1,1) PRIMARY KEY,
  skillName VARCHAR(50) NOT NULL,
  subCategoryId INT NOT NULL,
  FOREIGN KEY (subCategoryId) REFERENCES SubCategories(subCategoryId)
);



CREATE TABLE Mentors (
  mentorId INT IDENTITY(1,1) PRIMARY KEY,
  userId INT NOT NULL,
  bio VARCHAR(MAX) NOT NULL,
  hourlyRate VARCHAR(15) NOT NULL,
  FOREIGN KEY (userId) REFERENCES Users(userId)
);


CREATE TABLE Experience (
  experienceId INT IDENTITY(1,1) PRIMARY KEY,
  mentorId INT NOT NULL,
  description VARCHAR(MAX) NOT NULL,
  FOREIGN KEY (mentorId) REFERENCES Mentors(mentorId)
);

CREATE TABLE Expertise (
  expertiseId INT IDENTITY(1,1) PRIMARY KEY,
  mentorId INT NOT NULL,
  skillId INT NOT NULL,
  FOREIGN KEY (mentorId) REFERENCES Mentors(mentorId),
  FOREIGN KEY (skillId) REFERENCES Skills(skillId)
);



CREATE TABLE Mentees (
  menteeId INT IDENTITY(1,1) PRIMARY KEY,
  userId INT NOT NULL,
  FOREIGN KEY (userId) REFERENCES Users(userId)
);

CREATE TABLE MenteeInterests (
  menteeInterestId INT IDENTITY(1,1) PRIMARY KEY,
  menteeId INT NOT NULL,
  categoryId INT,
  subCategoryId INT,
  skillId INT,
  FOREIGN KEY (menteeId) REFERENCES Mentees(menteeId),
  FOREIGN KEY (skillId) REFERENCES Skills(skillId),
  FOREIGN KEY (categoryId) REFERENCES Categories(categoryId),
  FOREIGN KEY (subCategoryId) REFERENCES SubCategories(subCategoryId)
);

CREATE TABLE Slot (
  slotId INT IDENTITY(1,1) PRIMARY KEY,
  startTime TIME NOT NULL,
  endTime TIME NOT NULL
);

CREATE TABLE Booking (
  bookingId INT IDENTITY(1,1) PRIMARY KEY,
  mentorId INT NOT NULL,
  menteeId INT NOT NULL,
  skillId INT NOT NULL,
  status VARCHAR(50) NOT NULL,
  FOREIGN KEY (mentorId) REFERENCES Mentors(mentorId),
  FOREIGN KEY (menteeId) REFERENCES Mentees(menteeId),
  FOREIGN KEY (skillId) REFERENCES Skills(skillId)
);

CREATE TABLE BookingDetails(
	bookingDetailId INT IDENTITY(1,1) PRIMARY KEY,
	bookingId INT, 
	slotId INT,
	[date] DATE,
	FOREIGN KEY (bookingId) REFERENCES Booking(bookingId),
  FOREIGN KEY (slotId) REFERENCES Slot(slotId)
);

CREATE TABLE Feedback (
  feedbackId INT IDENTITY(1,1) PRIMARY KEY,
  menteeId INT NOT NULL,
  mentorId INT NOT NULL,
  bookingId INT NOT NULL,
  rating INT NOT NULL,
  reviewText VARCHAR(MAX) NOT NULL,
  reviewDateTime DATETIME NOT NULL,
  FOREIGN KEY (menteeId) REFERENCES Mentees(menteeId),
  FOREIGN KEY (mentorId) REFERENCES Mentors(mentorId),
  FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);

CREATE TABLE Notifications (
  notificationId INT IDENTITY(1,1) PRIMARY KEY,
  userId INT NOT NULL,
  bookingId INT NOT NULL,
  content VARCHAR(MAX) NOT NULL,
  dateTime DATETIME NOT NULL,
  type VARCHAR(50) NOT NULL,
  status VARCHAR(50) NOT NULL,
  FOREIGN KEY (userId) REFERENCES Users(userId),
  FOREIGN KEY (bookingId) REFERENCES Booking(bookingId)
);

CREATE TABLE ChatRoom (
  chatRoomId INT IDENTITY(1,1) PRIMARY KEY,
  chatRoomName VARCHAR(50) NOT NULL
);

CREATE TABLE ChatRoomUsers (
  chatRoomId INT NOT NULL,
  userId INT NOT NULL,
  FOREIGN KEY (chatRoomId) REFERENCES ChatRoom(chatRoomId),
  FOREIGN KEY (userId) REFERENCES Users(userId)
);

CREATE TABLE ChatMessages (
  chatMessagesId INT IDENTITY(1,1) PRIMARY KEY,
  chatRoomId INT NOT NULL,
  userId INT NOT NULL,
  message VARCHAR(MAX) NOT NULL,
  sentDateTime DATETIME NOT NULL,
  FOREIGN KEY (chatRoomId) REFERENCES ChatRoom(chatRoomId),
  FOREIGN KEY (userId) REFERENCES Users(userId)
);

Create table FAQ (
	id int IDENTITY(1,1),
	question varchar(255),
	answer varchar(255),
);

Create table PrivacyPolicyAndTerms(
   id int,	
   type int,
   summary varchar(255),
   content varchar(500)
);

CREATE TABLE ContactUs (
  id INT IDENTITY(1,1) PRIMARY KEY,
  infor VARCHAR(255),
  href VARCHAR(255)
);