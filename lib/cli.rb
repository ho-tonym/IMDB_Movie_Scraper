#UI
class MoviesCLI
  def start
    list_top_movies
    menu
  end

  def list_top_movies
  puts "Top Movies:"
   #start index at 1
     Movies.top_movies.each.with_index(1) do |movie, x|
       puts "#{x}. #{movie}"
     end
  #   binding.pry
  end

  def menu
    user_input = nil

      while user_input.to_i != 4
        puts <<-HEREDOC

Please enter a number for each selection:
1. List Top Movies
2. Search by Name
3. Search by Rank
4.
5. Exit
HEREDOC
        user_input = gets.to_i

    #  1. search by ranking
    #  2. search by name
    #  3. get entire list, type in name/ranking
              #list top movies

        if user_input == 1
          list_top_movies
        elsif user_input == 2

        elsif user_input == 3

        elsif user_input == 4
          goodbye
        else
          puts "Unable to process your request."
        end
      end
  end

  def goodbye
    puts "See you later!"
  end

end

#show Movies
#other functionality is optional
