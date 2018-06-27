LIST TOP 250 IMDB MOVIES

Howard's Refactor Requests
Let's refactor two main things:
1. Create a Scraper class that just is only responsible for scraping and passing the data to the appropriate model class
2. We want the model class, in this case Movie, to collect and hold actual Movie objects, not hashes
3. Let's not scrape more than once for the same movie data


GET LINK
user_input = gets.chomp.downcase
@movie_name = user_input
...
@movie_name = "The Shawshank Redemption"
movie = doc.at_xpath("//a[text()='#{@movie_name}']")
movie["href"]# this is for getting the link for a specific movie

IMDB RATING
doc.at_xpath('//td[@class="ratingColumn imdbRating"]').text.gsub(/\W/,' ').split(" ")
# only first one, more specific, array of ratings
doc.css("td[class='ratingColumn imdbRating']").text.gsub(/\s/,' ').split(" ")
# grabs all the imdb ratings, array of ratings

SEARCH BY NAME

doc.at_css('td:contains("1.")')
doc.at_css('td:contains("1.")').text.gsub(/\W/,' ').split(" ")
#search by first rank
## [rank, title, year]
ranking = array[0]
year it came out = [-1]

Director
doc.at_xpath('//span[@class="itemprop"]').text
doc.at_xpath('//span[@itemprop="director"]').text.split("\s").join(" ")
["\nFrank Darabont            "]
#only got the first one
doc.css('//span[@itemprop="director"]').text.split("\s").join(" ")
# grabs all the directors on the page

Plot Summary
doc.at_xpath('//div[@class="summary_text"]').text.split("\s").join(" ")

Gross USA
Gross WorldWide
Genres
doc.at_xpath('//div[@itemprop="genre"]').text.gsub(/\W/,' ').split(" ")[1..-1].join(", ")

#filter nonaphanumeric chracters out through .gsub, /\W/

Release Year

array = doc.at_xpath('//div[@id="titleDetails"]').text.split("\s")
#fix
gross_world = String.new
array.each_with_index do |word, index|
  if word == "Release"
    if array[index + 1] == "Date:"
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


good resoure:
https://stackoverflow.com/questions/39653384/how-to-extract-links-and-link-text-from-html-using-nokogiri

# <<-HEREDOC
#
# Please enter a number for each selection:
# 1. List Top Movies
# 2. Search by Name or Rank
# 3. Exit
# HEREDOC
#
# puts <<-Heredoc
#  "Director: #{movie.director}"
#  "Genre: #{movie.genres}"
#  "#{movie.plot_summary}"
#  "Gross USA: #{movie.gross_usa}"
#  "Gross Worldwide: #{movie.gross_world}"
# Heredoc
