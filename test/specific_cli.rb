#UI
class SpecificMovieCLI
  def start
    list_top_movies
    menu
    goodbye
  end

  def list_top_movies
    puts "Top Movies"
   @movies = Movies.top_movies
   #start index at 1
     @movies.each.with_index(1) do |movie, x|
       puts "#{x}. #{movie.title}"
     end
  #   binding.pry
  end

  def menu
    user_input = nil

      while user_input != "exit"
      puts "Enter the number of the deal you'd like more info on:"
      user_input = gets.strip.downcase

        if user_input.to_i > 0
          the_movie = @movies[user_input.to_i - 1]
          puts "#{the_movie.title}"
        elsif user_input == list_top_movies
          list_top_movies
        else
          puts "not sure what you want, please type list_top_movies or exit"
          # end
          #
          # case user_input
          # when "1"
          #   puts "information on 1"
          # when "2"
          #   puts "information on 2"
          # when "list_top_movies"
          #   list_top_movies
          # else
          #   puts "not sure what you want, please type list_top_movies or exit"
          # end
        end
      end
  end

  def goodbye
    puts "See you later!"
  end

end

#show Movies
#other functionality is optional
