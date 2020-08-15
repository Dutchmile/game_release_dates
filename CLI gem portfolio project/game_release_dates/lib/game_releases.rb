# require "game_release_dates/version"
 #require 'game_release_dates/lib/game_release_dates/games.rb'
class GameReleases
  
  MONTHS = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  PLATFORMS = ["playstation 4", "xbox one", "switch", "pc"]

  

  def initialize
    puts "Loading, please wait..."
     Games.add_games
    puts "Welcome! This app contains information about videogames. Use the following options to navigate:"
    menu
  end

  def menu
    puts "Choose from the options below"
         puts "
    1. Menu - Displays menu options
    2. List - Displays a list of upcoming game titles viewable through this app
    3. Search by Title - Find information for a specific game
    4. Search by Platform - Search for games based on the platform they are offered for
    5. Exit - Exit the program"
      input = gets.strip.downcase
      if input == "menu" || input == "1"
        menu
      elsif input == "list" || input == "2"
        list
      elsif input == "search by title" || input == "3"
        find_game_by_title
      elsif input == "search by platform" || input == "4"
        find_game_by_platform
      elsif input == "exit" || input == "5"
        goodbye
      elsif input == "debug"
        debug
      else
        puts "not a valid option."
        puts "\n"
        menu
      end
    # end
  end

    def find_game_by_title
    puts "Enter the title you would like to learn more about. To return to the menu, type menu"
        input_t = gets.strip.downcase
        if input_t == "menu"
          menu
        else
         # requested_game = nil
          if Games.all.detect {|game| game.title == input_t}
             Games.all.select do |game| 
              if game.title == input_t
                requested_game = game
              puts "\n"
              puts "#{requested_game.title.upcase} - #{requested_game.platform.upcase}"
              puts "\n"
              puts "#{requested_game.summary}"
            puts "\n"
            find_game_by_title
              end
            end
          else 
           puts "Sorry. That game could not be found"
           puts "\n"
          find_game_by_title
          end
        end
    #  end
    #  menu
    end

    def find_game_by_platform
      puts "To view a list of upcoming games for a specific system, enter the system name below."
      input = nil
      games_list = []
      input = gets.strip.downcase
      if input == "menu"
        menu
      else
        if Games.all.detect {|game| game.platform == input}
           Games.all.each do |game| 
            if game.platform == input
            games_list << game.title.capitalize
            end
          end 
            puts "The following games are #{input} exclusives:"
            puts "\n"
            puts games_list
          find_game_by_platform
        else
         puts "That is not a valid option."
          find_game_by_platform
        end
      end
    end

    def goodbye
      puts "Thanks for visiting. Check back in for all the latest upcoming games"
    end

    def list
      puts "Below is a list of the latest games"
      Games.list
      menu
    end

      def debug
        input = gets.strip
        while input != "restart"
          if input == "games"
            Games.all
          elsif input == "add games"
           Games.add_games
          elsif input == "add test game"
           Games.new(title: "title", summary: "summary", platform: "platform") 
           puts Games.all
          elsif input == "source p file"
           Games.source_p_file
          elsif input == "source t file"
            Games.source_t_file
         elsif input == "t"
           Games.game_titles
          elsif input == "p"
           Games.game_summary
         elsif input == "pl"
           Games.game_platforms
          elsif input == "menu"
           menu
          elsif input == "restart"
           GameReleases.new
          end
        end
      end
end