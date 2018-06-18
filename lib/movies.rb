class Movies #Object

attr_accessor :title, :rank, :release_date, :rating, :url
  @@movie_title_rank_h = {}
  # each movie object
  @@movie_objects = []
  @@movie_imdb_ratings = []


  # def self.top_movies
  #   self.scrape
  # end

  # def self.scrape
  #   movies_array = []
  #     movies_array << self.scrape_top_movies
  #   movies_array
  # end

  def self.top_movies
    doc = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250_6"))

    titles = doc.css("a[title]")

    titles.each_with_index(1) do |title, index|
      @@movie_title_rank_h[index] = title.text
    end
    @@movie_title_rank_h.pop(6)
    @@movie_title_rank_h.shift(7)
    @@movies_imdb_ratings = doc.css("td[class='ratingColumn imdbRating']").text.gsub(/\s/,' ').split(" ")
    #extraneous information
    binding.pry
    @@movie_title_rank_h
  end

  def search_by_name_or_rank(user_input)

      puts movie_rank
      puts movie_imdb_rating
      puts release_year
    else
      search by name



    @movie_name = user_input
    ...



    puts <<-HEREDOC
What would you like to know:
1. Director
2. Genres
4. Plot Summary
5. Gross USA
6. Gross Worldwide
HEREDOC

  end

  def search_logic(user_input)

      user_input = gets.to_i
      movie_name = @@movie_title_rank_h[number(userinput)]
      movie_nokogiri_object = doc.at_xpath("//a[text()='#{movie_name}']")
      what is movie.


      movie.link = movie_nokogiri_object"https://www.imdb.com/#{movie_nokogiri_object["href"]}"
      doc = Nokogiri::HTML(open("#{movie.link}"))

      movie.title = movie_name
      movie.rank = user_input
      movie.imdb_rating = @@movies_imdb_ratings[number(userinput)]

      movie.director = doc.at_xpath('//span[@itemprop="director"]').text.split("\s").join(" ")
      movie.genres = doc.at_xpath('//div[@itemprop="genre"]').text.gsub(/\W/,' ').split(" ").shift
      #array

      movie.plot_summary = doc.at_xpath('//span[@itemprop="creator"]').text.split("\s").join(" ")

      details_array = doc.at_xpath('//div[@id="titleDetails"]').text.split("\s")
      gross_usa = String.new
      details_array.each_with_index do |word, index|
        if word == "Gross"
          if array[index + 1] == "USA:"
            if array[index + 2].start_with?("$")
              gross_usa = array[index + 2]
            else
              "Not sure what the amount was"
            end
          end
        end
      end
      movie.gross_usa = gross_usa

      gross_world = String.new
      details_array.each_with_index do |word, index|
        if word == "Cumulative"
          if array[index + 1] == "WorldWide"
            if array [index + 2] == "Gross"
              if array[index + 3].start_with?("$")
                gross_world = array[index + 3]
              else
                "Not sure what the amount was"
              end
            end
          end
        end
      end
      movie.gross_world = gross_world
      movie.year_release = doc.at_xpath('//span[@id="titleYear"]').text
  end






  the_movie = @movies[number(userinput)]
  puts "#{the_movie.title}"








  def number(user_input)
    user_input + 1
  end





  def self.scrape_top_movies
    doc = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250_6"))

    movie = self.new
    top_movies_array = []

    doc.css("a[title]").text
    top_movies_array << movie.title

    movie.title = doc.css("a[title='Frank Darabont (dir.), Tim Robbins, Morgan Freeman']").text
    rank
    imdb_rating

    release_date
    genre
    gross_worldwide
    gross_usa
    plot_summary
    director


    # movie.name
    # doc.css("td.titleColumn").text.split(/\n+/)
    # :rank, :release_date, :rating, :url

    doc.css("a[title]").text
    #all the titles in one string

    binding.pry
    #type in a movie, checks if it is on imdb top 250 list
      #if it is, you can request to see more info or go back/exit
  end
end
