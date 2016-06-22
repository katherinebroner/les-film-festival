# [Lower East Side Film Festival](https://les-film-festival.herokuapp.com/)

Group Memebers

[John Colella](https://github.com/jmcolella)
[Esther Leytush](https://github.com/mindplace)
[Katherine Broner](https://github.com/katherinebroner)

Overview

Our challenge was to build a faux film festival web application to be used by general users and judges.  Both types of users can view films by category as well as leave posts and comments.  With just 3 group members and 2 days to work at the NYC Dev Bootcamp campus, we built a fully functional app that has been deployed live at les-film-festival.herokuapp.com.  Our stack is built on Rails, PostgreSQL, JavaScript (employing AJAX and the jQuery library) and Bootstrap as our front-end design framework.

Features

When coming to initial homepage for the website, there is the option to register as a general user or judge.  In order to register as a judge, they must have a special secret token, which was created via a unique algorithm.  The ability to differentiate between users and judges was important because judge ratings were weighted 70%, while user ratings were weighted 30%.  Each film is assigned to a specific category, where you can see the film rating as well as leave reviews and comments.  Users can navigate through musuem categories to see the most recent reviews and see the overall winners for each category.  The front-end Bootstrap design makes the webiste easy to navigate. 

Future Features

Moving forward, we plan on adding additional AJAX functionality to improve user experience.  In addition, we are in the process of writing RSpec tests.
