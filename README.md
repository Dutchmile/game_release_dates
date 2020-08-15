# game_release_dates
CLI gem portfolio project - game release dates

Contributers: Dutchmile

MIT license: CLI gem portfolio project/game_release_dates/LICENSE.txt

This CLI program is for the purpose of fulfilling the duties as per the assignment established in learn.co through Flatiron's Software Engineering program
Originally, the goal of this gem was to provide users with a way to simply discover the release dates for upcoming videogame titles over multiple platforms. During development, the goal shifted to provide a greater description of each videogame title. Thus, this gem serves to provide users information, in general, for announce, upcoming videogames. The information offered for each videogame includes the title, the platform the game is released for, and a brief summary describing what to expect for each game
This app utilizes data scraped from multiple webpages across the Gameradar website, 'Gamesradar.com'

Upon startup, users are presented with a menu that outlines the options with which they can browse the current list of videogames available through the app. If the users are unsure what games are available or if they wish to browse through a selection of games, the user can access a comprehensive list of all videogames the app currently displays. Through this list, the user can search for a game, via another menu option, using its title, which will display the title, the platform on which the game is offered(playstation, xbox, etc.), and a brief summary describing the game itself. Additionally, the users also have the ability to search for a specific platform, which will provide a list of all the game titles provided specifically for that platform. From either the title or platform search options, the user is able to return to the menu to continue using the app.

Each game is created through the 'Game' class, and are unique instances which their own attributes. These include the title, summary, and platform. Information for the title and summary are scraped directly from the Gamesradar webpages. The 'platform' attributes are directly labled as the platforms for each game correspond to their respective webpage sources. Barring any major updates to the source webpages, the coding responsible for constructing each 'Game' object allows for the app to update itself along with the webpage itself.

Through development, it became necessary to build a debug function to aid in troubleshooting. This option is not made apparent to the user and is a hidden function meant only for the developer.

Due to access constraints and other issues, this app is operated primarily through Repl.it. To access and run this app, go the the following URL: https://repl.it/@Dutchmile/gamereleasedatesrb-1#main.rb
