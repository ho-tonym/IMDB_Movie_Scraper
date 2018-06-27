class Scraper

  def self.scrape_top_250
    doc = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250_6"))

    titles = doc.css("a[title]")
    titles_array = []

    titles.each do |title|
      titles_array << title.text
    end

    titles_array.pop(6)
    titles_array.shift(7)

    titles_array
    #return rirles array for the movie.function to make into a hash to diusplay to the user
  end

  def self.scrape_link(movie, movie_name)
    if movie.title == nil
      doc = Nokogiri::HTML(open("https://www.imdb.com/chart/top?ref_=nv_mv_250_6"))
      movie_nokogiri_object = doc.at_xpath("//a[text()='#{movie_name}']")
      imdb_ratings_array = doc.css("td[class='ratingColumn imdbRating']").text.gsub(/\s/,' ').split(" ")

      link_location = movie_nokogiri_object["href"]
      movie.link = "https://www.imdb.com#{link_location}"
      doc = Nokogiri::HTML(open("#{movie.link}"))

      movie.title = movie_name
      Movie.all_movie_titles.each do |rank,title|
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


      #eturn a movie object to pass to movie.function
    end
  end
end
