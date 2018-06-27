class Movie #Object

attr_accessor :link, :title, :rank, :imdb_rating, :director, :genres,
:plot_summary, :gross_usa, :gross_world, :year_release

#Note to Howard:
# It would be more optimal to create the movie objects when the user requests it, rather then creating all 250 movie objects
# at the start of the application.
# @@movie_title_rank_h would hold an integer and a string value to display to the user
# and we would create movie objects stored  by their rank as the key in the @@movies hash which we will use to check
# if we have already scraped this object before.
# Also at the beginning we scrape because if the user wants to enter a movie without pressing 1.
# and listing the movies first, the data would'nt be populated yet.

  @@movies = []
  #movie objects
  @@movie_title_rank_h = {}
  # key => ranking(int)
  # value => title(string)
  # 1-250

  def self.all_movie_titles # allow cli to access info
    @@movie_title_rank_h
  end
  # def self.

  def self.scrape # grab info
    doc = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250_6"))

    titles = doc.css("a[title]")
    titles_array = []

    titles.each do |title|
      titles_array << title.text
    end

    titles_array.pop(6)
    titles_array.shift(7)

    titles_array.each_with_index do |title, index|
      @@movie_title_rank_h[index + 1] = title
    end
  end

  def self.search_by_name(movie_name) # search by name, create movie object
    movie = self.new
    # check to see if the movie object is already in our hash
    @@movies.each do |movie_title|
      if movie_name == movie_title.title
        movie = movie_title
      end
    end
    # if it isnt, we will find the link and scrape it
    if movie.title == nil
      doc = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250_6"))
      movie_nokogiri_object = doc.at_xpath("//a[text()='#{movie_name}']")
      imdb_ratings_array = doc.css("td[class='ratingColumn imdbRating']").text.gsub(/\s/,' ').split(" ")

      link_location = movie_nokogiri_object["href"]
      movie.link = "https://www.imdb.com#{link_location}"
      doc = Nokogiri::HTML(open("#{movie.link}"))

      movie.title = movie_name
      @@movie_title_rank_h.each do |rank,title|
        if title == movie.title
          movie.rank = rank
        end
      end
      movie.imdb_rating = imdb_ratings_array[movie.rank - 1]
      movie.director = doc.css('//span[@itemprop="director"]').text.split("\s").join(" ")
      movie.genres = doc.at_xpath('//div[@itemprop="genre"]').text.gsub(/\W/,' ').split(" ")[1..-1].join(", ")
      movie.plot_summary = doc.at_xpath('//div[@class="summary_text"]').text.split("\s").join(" ")

      details_array = doc.at_xpath('//div[@id="titleDetails"]').text.split("\s")
      gross_usa = String.new
      details_array.each_with_index do |word, index|
        if word == "Gross"
          if details_array[index + 1] == "USA:"
            if details_array[index + 2].start_with?("$")
              gross_usa = details_array[index + 2].chomp(",")
            end
          end
        end
      end

      gross_world = String.new
      details_array.each_with_index do |word, index|
        if word == "Cumulative"
          if details_array[index + 1] == "Worldwide"
            if details_array[index + 2] == "Gross:"
              if details_array[index + 3].start_with?("$")
                gross_world = details_array[index + 3].chomp(",")
              end
            end
          end
        end
      end

      if gross_usa == ""
        gross_usa = "N/A"
      end
      if gross_world == ""
        gross_world = "N/A"
      end

      movie.gross_usa = gross_usa
      movie.gross_world = gross_world

      movie.year_release = doc.at_xpath('//span[@id="titleYear"]').text
      @@movies << movie
      movie
    end
  end
end

#The Godfather
