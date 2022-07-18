CREATE TABLE `regularuser` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `ProfilePic` varchar(100) DEFAULT NULL,
  `UserType` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`),
  UNIQUE KEY `ProfilePic_UNIQUE` (`ProfilePic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into music.regularuser values(0, 'alan', 'alan@gmail.com', 'alan123', 'Alan', 'Timmy', '2001-01-01', 'user.png', 'artist'),
(0, 'Jane', 'jane@gmail.com', 'jane123', 'Jane', 'Smith', '1990-08-25', 'user2.png', 'artist'),
(0, 'Ken', 'ken@gmail.com', 'ken123', 'Ken', 'Lennie', '1991-02-14', 'user3.png', 'artist');

CREATE TABLE `adminuser` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `music`.`song` (
  `SongID` INT NOT NULL AUTO_INCREMENT,
  `SongName` VARCHAR(45) NOT NULL,
  `ArtistName` VARCHAR(50) NOT NULL,
  `Description` VARCHAR(100) NOT NULL,
  `SongImage` varchar(100) NOT NULL,
  `Genre` VARCHAR(50) NOT NULL,
  `Year` VARCHAR(11) NOT NULL,
  `SongFile` varchar(100) NOT NULL,
  `UserID` INT NOT NULL,
  PRIMARY KEY (`SongID`),
  UNIQUE KEY `SongFile_UNIQUE` (`SongFIle`),
  CONSTRAINT `FK1` FOREIGN KEY (`UserID`) REFERENCES `regularuser` (`UserID`) ON DELETE CASCADE 
  );

insert into music.song values(0, 'Astronaut In The Ocean', 'Masked Wolf','Written by Masked Wolf', 'Astronaut In The Ocean.jpg',  'Jazz', '2021', 'Astronaut In The Ocean.mp3', 1),
(0, 'Enemy', 'Imagine Dragons','Produced by Ed Imagine Dragons', 'Enemy.jpg',  'Techno', '2020', 'Enemy.mp3', 1),
(0, 'Popular Monster', 'Falling In Reverse','Performed by Falling In Reverse', 'Popular Monster.jpg',  'Rock', '2021', 'Popular Monster.mp3', 1),
(0, 'Fancy Like', 'Walker Hayes','Written by Walker Hayes', 'Fancy Like.jpg',  'Rhythm and Blues', '2022', 'Fancy Like.mp3', 1),
(0, 'All Too Well - Taylors Version', 'Taylor Swift','Performed by Taylor Swift', 'All Too Well - Taylors Version.jpg',  'Pop', '2022', 'All Too Well - Taylors Version.mp3', 2),
(0, 'Blessed & Free', 'Kane Brown','Written by Kane Brown', 'Blessed & Free.jpg',  'Rock', '2018', 'Blessed & Free.mp3', 2),
(0, 'The Diary of Jane', 'Breaking Benjamin','Produced by Breaking Benjamin', 'The Diary of Jane.jpg',  'Hip-hop', '2021', 'The Diary of Jane.mp3', 2),
(0, 'Cold Heart PNAU Remix', 'Elthon John','Written by Elthon John', 'Cold Heart PNAU Remix.jpg',  'Rhythm and Blues', '2022', 'Cold Heart PNAU Remix.mp3', 3),
(0, 'Dance Monkey', 'Tones and I','Performed by Tones and I', 'Dance Monkey.jpg',  'Hip-hop', '2021', 'Dance Monkey.mp3', 3),
(0, 'Fingers Crossed', 'Lauren Spencer-Smith','Performed by Lauren Spencer-Smith', 'Fingers Crossed.jpg',  'Rock', '2019', 'Fingers Crossed.mp3', 2),
(0, 'Ghost', 'Justin Bieber','Performed by Justin Bieber', 'Ghost.jpg',  'Techno', '2022', 'Ghost.mp3', 3),
(0, 'Heat Waves', 'Glass Animals','Performed by Glass Animals', 'Heat Waves.jpg',  'Pop', '2022', 'Heat Waves.mp3', 1),
(0, 'Bad Liar', 'Imagine Dragons','Performed by Imagine Dragons', 'Bad Liar.jpg',  'Hip-hop', '2022', 'Bad Liar.mp3', 2),
(0, 'Believer', 'Imagine Dragons','Performed by Imagine Dragons', 'Believer.jpg',  'Pop', '2021', 'Believer.mp3', 3),
(0, 'Thunder', 'Imagine Dragons','Performed by Imagine Dragons', 'Thunder.jpg',  'Jazz', '2022', 'Thunder.mp3', 1),
(0, 'Levitating', 'Dua Lipa','Performed by Dua Lipa', 'Levitating.jpg',  'Rhythm and Blues', '2022', 'Levitating.mp3', 2),
(0, 'What I ve Done ', 'Linkin Park','Performed by Linkin Park', 'What I ve Done.jpg',  'Jazz', '2022', 'What I ve Done.mp3', 3),
(0, 'Oh My God', 'Adele','Performed by Adele', 'Oh My God.jpg',  'Techno', '2022', 'Oh My God.mp3', 1),
(0, 'One Right Now', 'Post Malone','Performed by Post Malone', 'One Right Now.jpg',  'Jazz', '2022', 'One Right Now.mp3', 2),
(0, 'Last Resort', 'Papa Roach','Performed by Papa Roach', 'Last Resort.jpg',  'Rhythm and Blues', '2022', 'Last Resort.mp3', 3),
(0, 'Easy On Me', 'Adele', 'Written by Adele AdkinsGreg, Kurstin', 'Easy On Me.jpg', 'Pop', '2021', 'Easy On Me.mp3', 1),
(0, 'Shivers', 'Ed Sheeran','Produced by Ed Sheeran, FRED, Steve Mac', 'Shivers.jpg',  'Rock', '2022', 'Shivers.mp3', 1),
(0, 'Bad Habits', 'Ed Sheeran','Performed by Ed Sheeran', 'Bad Habits.jpg',  'Hip-hop', '2019', 'Bad Habits.mp3', 1);


CREATE TABLE `music`.`album` (
  `AlbumID` INT NOT NULL AUTO_INCREMENT,
  `AlbumName` VARCHAR(50) NOT NULL,
  `ArtistName` VARCHAR(45) NOT NULL,
  `AlbumDescription` varchar(100) NOT NULL,
  `AlbumCover` VARCHAR(100) DEFAULT NULL,
  `SongName` VARCHAR(45) NOT NULL,
  `UserID` INT NOT NULL,
  PRIMARY KEY (`AlbumID`),
  KEY `UserID_idx` (`UserID`),
  CONSTRAINT `FK2` FOREIGN KEY (`UserID`) REFERENCES `regularuser` (`UserID`) ON DELETE CASCADE 
);
 
 INSERT INTO `album` VALUES (1,'Focus','Ed Sheeran','Produced by Ed Sheeran, FRED, Steve Mac','Bad Habits.jpg','Shivers.mp3',1),
 (2,'Focus','Ed Sheeran','Produced by Ed Sheeran, FRED, Steve Mac','Bad Habits.jpg','Bad Habits.mp3',1),
 (3,'Fancy','Walker Hayes','Written by Walker Hayes','Fancy Like.jpg','Fancy Like.mp3',1),
 (4,'Best of 2017','Imagine Dragons','Performed by Imagine Dragons','Best of 2017.jpg','Thunder.mp3',1),
 (5,'Heat Waves','Glass Animals','Performed by Glass Animals','Heat Waves.jpg','Heat Waves.mp3',1),
 (6,'30','Adele ','Written by Adele AdkinsGreg, Kurstin','Easy On Me.jpg','Oh My God.mp3',1),
 (7,'30','Adele ','Written by Adele AdkinsGreg, Kurstin','Easy On Me.jpg','Easy On Me.mp3',1),
 (8,'Enemy','Imagine Dragons','Produced by Ed Imagine Dragons','Enemy.jpg','Enemy.mp3',1),
 (9,'Best of 2021','Jane','Written by Jane','Last Resort.jpg','Blessed & Free.mp3',2),
 (10,'Best of 2021','Jane','Written by Jane','Last Resort.jpg','The Diary of Jane.mp3',2),
 (11,'New Album','Jane','Produced by Jane','Believer.jpg','Fingers Crossed.mp3',2),
 (12,'New Album','Jane','Produced by Jane','Believer.jpg','Bad Liar.mp3',2),
 (13,'New Album','Jane','Produced by Jane','Believer.jpg','Levitating.mp3',2),
 (14,'Believer','Ken','Performed by Imagine Dragons','Believer.jpg','Believer.mp3',3),
 (15,'Old','Ken','Written by Ken','What I ve Done.jpg','What I ve Done.mp3',3);
