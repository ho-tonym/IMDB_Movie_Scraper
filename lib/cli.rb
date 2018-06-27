class MoviesCLI

  def initialize
      @in_movie_menu = false
      @current_movie = nil
  end

  def start
    Movie.scrape
    menu
    goodbye
  end

  def goodbye
    puts "See you later!"
  end

  def list_top_movies
  puts "Top Movies:"
     Movie.all_movie_titles.each do |x, movie|
       puts "#{x}. #{movie}"
     end
  end

  def list_search_by_name
    puts "Please enter the name of the movie you would like to get more information on:"
    movie_to_search = gets.strip

    if movie_to_search == "back"
      @in_movie_menu = false
      menu
    elsif Movie.all_movie_titles.has_value?(movie_to_search)
      @current_movie = Movie.search_by_name(movie_to_search)
      movie_menu(@current_movie)
    else
        puts "That's not a selection, please enter a movie on the list or type back to go back."
        list_search_by_name
    end
  end

    # movie_menu(movie)
    # movie = Movie.search_by_name(movie_to_search)

  def menu
      while @in_movie_menu == false
        puts <<-HEREDOC.gsub /^\s*/, ""
        ------------------------------------------
        Welcome to the Top 250 IMDB Movie Scraper!
        Please enter a number for each selection:
        1. List Top Movies
        2. Search by Name
        3. Exit
        ------------------------------------------
        HEREDOC
        user_input = gets.strip.to_i

        if user_input == 1
          list_top_movies
        elsif user_input == 2
          @in_movie_menu = true
          list_search_by_name
        elsif user_input == 3
          @in_movie_menu = true
        else
          puts "Unable to process your request."
        end
      end
    end
  end

  def movie_menu(movie)
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

      movie_menu_input = gets.strip.to_i

        if movie_menu_input == 1
          puts "Director: #{movie.director}"
          movie_menu(@current_movie)
        elsif movie_menu_input == 2
          puts "Genre: #{movie.genres}"
          movie_menu(@current_movie)
        elsif movie_menu_input == 3
          puts "#{movie.plot_summary}"
          movie_menu(@current_movie)
        elsif movie_menu_input == 4
          puts "Gross USA: #{movie.gross_usa}"
          movie_menu(@current_movie)
        elsif movie_menu_input == 5
          puts "Gross Worldwide: #{movie.gross_world}"
          movie_menu(@current_movie)
        elsif movie_menu_input == 6
          @in_movie_menu = false
          menu
        elsif movie_menu_input == 7

        else
          puts "Unable to process your request."
  end
end

# Let's refactor two main things:
# 1. Create a Scraper class that just is only responsible for scraping and passing the data to the appropriate model class - Done
# 2. We want the model class, in this case Movie, to collect and hold actual Movie objects, not hashes - Done
# 3. Let's not scrape more than once for the same movie data - Done
