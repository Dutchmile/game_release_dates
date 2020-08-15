#!/usr/bin/env ruby
 require 'nokogiri'
 require 'open-uri'
# require 'pry'
class Games

  attr_accessor :title, :release_date, :summary, :platform, :doc_ps4, :doc_ps4_t, :doc_switch, :doc_switch_t, :doc_xbox, :doc_xbox_t

  @@all_games = []

  # puts "Games files loaded"
  
  def initialize(title:, summary:, platform:)
    @title = title
    @release_date = release_date
    @platform = platform
    @summary = summary
    @@all_games << self
  end

  def self.add_games
    puts "Loading games..."
    @doc_ps4 = Nokogiri::HTML(open("https://www.gamesradar.com/upcoming-ps4-games/"))
    @doc_switch = Nokogiri::HTML(open("https://www.gamesradar.com/upcoming-nintendo-switch-games/"))
    @doc_xbox = Nokogiri::HTML(open("https://www.gamesradar.com/upcoming-xbox-one-games/"))
    @doc_ps4_t = []
    doc_ps4_p = @doc_ps4.css("p").text.split("\n")
    @doc_switch_t = []
    doc_switch_p = @doc_switch.css("p").text.split("\n")
    @doc_xbox_t = []
    doc_xbox_p = @doc_xbox.css("p").text.split("\n")
    @doc_ps4.css("h2").each do |t|
      @doc_ps4_t << t.text.downcase
    end
    @doc_switch.css("h2").each do |t|
      @doc_switch_t << t.text.downcase
    end
    @doc_xbox.css("h2").each do |t|
      @doc_xbox_t << t.text.downcase
    end
    Games.new(title: @doc_ps4_t[0], summary: doc_ps4_p[6], platform: "ps4")
    Games.new(title: @doc_ps4_t[1], summary: doc_ps4_p[8], platform: "ps4")
    Games.new(title: @doc_ps4_t[2], summary: doc_ps4_p[9], platform: "ps4")
    Games.new(title: @doc_ps4_t[3], summary: doc_ps4_p[10], platform: "ps4")
    Games.new(title: @doc_switch_t[0], summary: doc_switch_p[6], platform: "nintendo switch")
    Games.new(title: @doc_switch_t[1], summary: doc_switch_p[8], platform: "nintendo switch")
    Games.new(title: @doc_switch_t[2], summary: doc_switch_p[11], platform: "nintendo switch")
    Games.new(title: @doc_switch_t[3], summary: doc_switch_p[13], platform: "nintendo switch")
    Games.new(title: @doc_xbox_t[0], summary: doc_xbox_p[6], platform: "xbox one")
    Games.new(title: @doc_xbox_t[1], summary: doc_xbox_p[7], platform: "xbox one")
    Games.new(title: @doc_xbox_t[2], summary: doc_xbox_p[9], platform: "xbox one")
    Games.new(title: @doc_xbox_t[3], summary: doc_xbox_p[11], platform: "xbox one")
  end
  
  def self.all  
    
   @@all_games
  end

  def self.list
    
     games_list = []
     @@all_games.each do |game|
      games_list << game.title
     end
     puts games_list
  end

  def self.reset_list
    @@all_games.clear
  end

  def self.source_p_file
    puts "Which p file?"
    input = gets.strip
    case input
    when "ps4"
    puts @doc_ps4.css("p").text.split("\n")
    when "switch" 
      puts @doc_switch.css("p").text.split("\n")
    when "xbox"
      puts @doc_xbox.css("p").text.split("\n")
    end
  end

  def self.source_t_file
    puts "which t file?"
    input = gets.strip
    case input
    when "ps4"
      puts @doc_ps4_t
    when "switch"
      puts @doc_switch_t
    when "xbox"
      puts @doc_xbox_t
    end
  end

  def self.ps4_t_list
    puts @doc_ps4_t
  end
  def self.game_titles
    game_titles = []
    @@all_games.each {|game| game_titles << game.title}
    puts game_titles
  end
  def self.game_summary
    game_summaries = []
    @@all_games.each {|game| game_summaries << game.summary}
    puts game_summaries
  end
  def self.game_platforms
    game_platforms = []
    @@all_games.each {|game| game_platforms << game.platform}
    puts game_platforms
  end
end