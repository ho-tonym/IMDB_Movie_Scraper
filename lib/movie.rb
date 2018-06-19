class Movie #Object

attr_accessor :link, :title, :rank, :imdb_rating, :director, :genres,
:plot_summary, :gross_usa, :gross_world, :year_release

  @@movie_title_rank_h = {}
  # each movie object
  @@movies_imdb_ratings = []
  # 0-249


  # def self.top_movies
  #   self.scrape
  # end

  # def self.scrape
  #   movies_array = []
  #     movies_array << self.scrape_top_movies
  #   movies_array
  # end
  def self.all_movies
    @@movie_title_rank_h
  end

  def self.top_movies
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

    @@movies_imdb_ratings = doc.css("td[class='ratingColumn imdbRating']").text.gsub(/\s/,' ').split(" ")
    @@movie_title_rank_h
  end

    def self.search_by_name(movie_name)
        #between is inclusive for both numbers
      doc = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250_6"))
      movie_nokogiri_object = doc.at_xpath("//a[text()='#{movie_name}']")

      movie = self.new

      link_location = movie_nokogiri_object["href"]
      movie.link = "https://www.imdb.com#{link_location}"
      doc = Nokogiri::HTML(open("#{movie.link}"))

      movie.title = movie_name
      #fix hard coded,

      @@movie_title_rank_h.each {|rank,title|
        if title == movie.title
          movie.rank = rank #assign rank
        end
        }
      movie.imdb_rating = @@movies_imdb_ratings[movie.rank - 1]
      movie.director = doc.css('//span[@itemprop="director"]').text.split("\s").join(" ")
      movie.genres = doc.at_xpath('//div[@itemprop="genre"]').text.gsub(/\W/,' ').split(" ")[1..-1].join(", ")
      #array
      movie.plot_summary = doc.at_xpath('//div[@class="summary_text"]').text.split("\s").join(" ")

      details_array = doc.at_xpath('//div[@id="titleDetails"]').text.split("\s")
      gross_usa = String.new
      details_array.each_with_index do |word, index|
        if word == "Gross"
          if details_array[index + 1] == "USA:"
            if details_array[index + 2].start_with?("$")
              gross_usa = details_array[index + 2]
            else
              gross_world = "Not sure what the amount was"
            end
          end
        end
      end
      movie.gross_usa = gross_usa

      gross_world = String.new
      details_array.each_with_index do |word, index|
        if word == "Cumulative"
          if details_array[index + 1] == "Worldwide"
            if details_array[index + 2] == "Gross:"
              if details_array[index + 3].start_with?("$")
                gross_world = details_array[index + 3]
              else
                gross_world = "Not sure what the amount was"
              end
            end
          end
        end
      end
      movie.gross_world = gross_world
      movie.year_release = doc.at_xpath('//span[@id="titleYear"]').text
      movie
  end
end

#The Godfather
