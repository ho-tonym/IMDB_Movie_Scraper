#UI
class MoviesCLI
  def initialize
      @looking_at_a_movie = false
      Movie.scrape
  end

  def start
    menu
    goodbye
  end

  def list_top_movies
  puts "Top Movies:"
     Movie.all_movies.each do |x, movie|
       puts "#{x}. #{movie}"
     end
  end

  def list_search_by_name
    puts "Please enter the name of the movie you would like to get more information on:"
    @movie_to_search = gets.strip
    if @movie_to_search == "back"
      @movie_to_search
    else
      if Movie.all_movies.has_value?(@movie_to_search)
        movie = Movie.search_by_name(@movie_to_search)
      else
      puts "That's not a selection, please enter a movie on the list or type back to go back."
        list_search_by_name
      end
    end
  end

  def menu
      @user_input = nil
      while @looking_at_a_movie == false
        puts <<-HEREDOC.gsub /^\s*/, ""
        ------------------------------------------
        Welcome to the Top 250 IMDB Movie Scraper!

        Please enter a number for each selection:
        1. List Top Movies
        2. Search by Name or Rank
        3. Exit
        ------------------------------------------
        HEREDOC
        @user_input = gets.strip.to_i

        if @user_input == 1
          list_top_movies
        elsif @user_input == 2
          @looking_at_a_movie = true
          movie = list_search_by_name
          if movie == "back"
            @looking_at_a_movie = false
            menu
          else
            movie_menu(movie)
          end
        elsif @user_input == 3
          @looking_at_a_movie = true
        else
          puts "Unable to process your request."
        end
      end
    end
  end

  def movie_menu(movie)
      @movie_menu_input = nil

      while @movie_menu_input != 6 || @movie_menu_input != 7
        puts <<-HEREDOC.gsub /^\s*/, ""
        ------------------------------------------
        Movie: #{movie.title} - #{movie.year_release} | Rank: #{movie.rank} | IMDB Rating: #{movie.imdb_rating}

        Please enter a number for your selection:
        1. Director
        2. Genres
        3. Plot Summary
        4. Gross USA
        5. Gross Worldwide
        6. Menu
        7. Exit
        ------------------------------------------
        HEREDOC

      @movie_menu_input = gets.strip.to_i

      if @movie_menu_input == 1
        puts "Director: #{movie.director}"
      elsif @movie_menu_input == 2
        puts "Genre: #{movie.genres}"
      elsif @movie_menu_input == 3
        puts "#{movie.plot_summary}"
      elsif @movie_menu_input == 4
        puts "Gross USA: #{movie.gross_usa}"
      elsif @movie_menu_input == 5
        puts "Gross Worldwide: #{movie.gross_world}"
      elsif @movie_menu_input == 6
        @looking_at_a_movie = false
        menu
      elsif @movie_menu_input == 7
        goodbye
      else
        puts "Unable to process your request."
      end
  end

  def goodbye
    puts "See you later!"
  end
end
#The Shawshank Redemption

#show Movies
#other functionality is optional
