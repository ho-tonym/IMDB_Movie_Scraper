#UI
class MoviesCLI
  def start
    list_top_movies
    menu
    goodbye
  end

  def list_top_movies
    puts "Top Movies"
    puts
    <<-DOC
    1. "ShawShank Redemption"
    2. "Inception"
    DOC

    @deals = Movies.today
    #
    # Movie Details include:
    # 1. Rank
    # 2. Title
    # 3. Year of Release Date
    # 4. IMDB rating
    # 5. Director
    # 6. Writers
    # 7. Main Actors
    # 8. Plot Summary
    # 9. Gross USA
    # 10. Gross WorldWide


  end

  def menu
    user_input = nil
      while user_input != "exit"
      puts "Enter the number of the deal you'd like more info on:"
      input = gets.strip.downcase

        case user_input
        when "1"
          puts "information on 1"
        when "2"
          puts "information on 2"
        when "list_top_movies"
          list_top_movies
        else
          puts "not sure what you want, please type list_top_movies or exit"
        end
      end
  end

  def goodbye
    puts "See you later!"
  end

end

#show Movies
#other functionality is optional
