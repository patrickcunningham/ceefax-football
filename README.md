# Ceefax Football  - BBC Software Engineering & Internet Applications MSc - Mobile Applications iOS
The Ceefax Football application offers a teletext style view of a subset of the latest BBC football news and features.  It follows the functionality of the old ceefax system where each page is assigned a number that can be entered with a keypad or pages can be scrolled through in numerical page number order.

As part of the course, a deliverable is a final project that covers certain topics learned over the period of the three day course.  The final project is in the form of a fully functioning iOS application.  This document proposes the details of the project, how it aims to cover the requirements of the final project and justifications.

##Background
Before the widespread use of the internet in the UK, it was common that people could obtain news on demand through their television sets by using a feature called teletext.  The first transmissions of the service was made in 1973 and was pioneered by the BBC.  The version became known as Ceefax (see-facts) and soon became European and worldwide standard.  Typically each page was given a number and a user would use their television remote to enter the desired page number.  This service in the UK was particularly popular with sports fans for details of sporting events, reports, live scores and analysis.  With the advances in technology and connectivity of people to the internet, unfortunately the use of teletext services declined and BBC’s pioneering Ceefax service was turned off in 2012.

##Proposed Application
The aim of this project is to produce an application with the look and feel of the old Ceefax Football news service in the UK, or page 302 to those used to using the service.  This app aims to bring back the nostalgia of looking at the simple designs and fonts to gain a fix of football news.  This will use the BBC football news RSS feed to get its data and display in a format similar to that of Ceefax page 302.

##Requirements
The targe iOS version is 7.  This app should compile and run on iPad (3rd generation or later), iPad mini (1st generation or later), iPhone 5 and iPod touch 5th generation.
The application should have:
 * iOS UI Design
 * Data Storage and Management
 * Network resources or Sprite Kit
 * Data parsing
 * Location Detection
 * Gestures


###IOS UI Design
This application will have the look and feel of the old BBC Ceefax system. This will be designed using fonts, colors and images.  This should be done using a storyboard or programmatically

###Data Storage and Management
The RSS feed should be stored cached or possibly stored locally for when the application cannot connect to the internet

###Network Resources or Sprite Kit
A live RSS feed from the BBC Sport website will be used to gather the headlines and stories for each page.  As the feeds used for the Ceefax service have been turned off, therefore the correct amount of data to load a typical ceefax news page no longer exists, a simple description from an RSS feed item will be used and a clickable link will be added so the user can go to the internet to get more information on the story.

###Data Parsing
An RSS formatted xml feed will be parsed and displayed in Teletext style

###Location Detection
An option for local football news dependent on a users location

###Gestures
Gestures should be used to swipe from one page to the next.

