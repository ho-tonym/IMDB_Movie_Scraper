#UI
class MoviesCLI
  def start
    list_top_movies
    menu
  end

  def list_top_movies
    puts "Top Movies"
    puts
    <<-DOC
    1. "ShawShank Redemption"
    2. "Inception"
    DOC

  end

  def menu
    puts "Enter the number of the deal you'd like more info on:"
  end

end

#show Movies
#other functionality is optional
