LIST TOP 250 IMDB MOVIES

GET LINK
user_input = gets.chomp.downcase
@movie_name = user_input
...
@movie_name = "The Shawshank Redemption"
movie = doc.at_xpath("//a[text()='#{@movie_name}']")
movie["href"]# this is for getting the link
https://www.imdb.com/"#{movie["href"]}"

show rank, imdb rating
(rank)

IMDB RATING
doc.at_xpath('//td[@class="ratingColumn imdbRating"]').text.gsub(/\W/,' ').split(" ").join(".")
# only first one, more specific
doc.css("td[class='ratingColumn imdbRating']").text.gsub(/\s/,' ').split(" ")
# all of them




SEARCH BY RANK/NAME

doc.at_css('td:contains("1.")')
first rank
doc.at_css('td:contains("1.")').text.gsub(/\W/,' ').split(" ")

ranking = array[0]
year it came out = [-1]

title = array.shift
array.pop
title = array

##########


5. Director
doc.at_xpath('//span[@class="itemprop"]').text
doc.at_xpath('//span[@itemprop="director"]').text.split("\s").join(" ")
["\nFrank Darabont            "]

8. Plot Summary
doc.at_xpath('//span[@itemprop="creator"]').text.split("\s").join(" ")

9. Gross USA
h3 = boxoffice
h4 class = inline - gross usa
doc.at_xpath('//div[@id="article"]').text.split("\s")
doc.at_css('h4:contains("Gross USA:")').text.split("\s")

array = doc.at_xpath('//div[@id="titleDetails"]').text.split("\s")

gross_usa = String.new
array.each_with_index do |word, index|
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



10. Gross WorldWide

array = doc.at_xpath('//div[@id="titleDetails"]').text.split("\s")

gross_world = String.new
array.each_with_index do |word, index|
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

11. Genres

array = doc.at_xpath('//div[@itemprop="genre"]').text.gsub(/\W/,' ').split(" ").shift

array.each do |genre|
  puts genre
end


filter nonaphanumeric chracters out
gsub taks it out

RELEASE Date

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


#########
# too general
# text associated with that value
# doc.at_css('a:contains("Godfather")')



    # movie_1 = self.new
    # movie_1.title = "ShawShank Redemption"
    # movie_1.rank = 1
    # movie_1.release_date = "October, 14, 1994"
    # movie_1.rating = 9.2
    # movie_1.url = "https://www.imdb.com/title/tt0111161/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=SVB7JNCNSZ9BW7WAA5WZ&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_1"
    #
    # movie_2 = self.new
    # movie_2.title = "The GodFather"
    # movie_2.rank = 2
    # movie_2.release_date = "1972"
    # movie_2.rating = 9.2
    # movie_2.url = "https://www.imdb.com/title/tt0068646/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=SVB7JNCNSZ9BW7WAA5WZ&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_2"
    #
    # 5. Director
    # 6. Writers
    # 7. Main Actors
    # 8. Plot Summary
    # 9. Gross USA
    # 10. Gross WorldWide
    #[movie_1, movie_2]

    #https://www.imdb.com/chart/top?ref_=nv_mv_250_6

    #title = doc.css('#chart-top250movie a.Frank Darabont (dir.), Tim Robbins, Morgan Freeman').text
    # year = doc.css("a.title").text
    # doc.css("td.titleColumn").text- grabs all the td.title columns
    # doc.css("td#titleColumn a.Frank Darabont (dir.), Tim Robbins, Morgan Freeman").text

    movie = self.new
    #First Movie - Shawshank Redemption
    top_movies_array = []

    doc.css("a[title]").text
    top_movies_array << movie.title

    movie.title = doc.css("a[title='Frank Darabont (dir.), Tim Robbins, Morgan Freeman']").text

    # movie.name
    # doc.css("td.titleColumn").text.split(/\n+/)
    # :rank, :release_date, :rating, :url

    doc.css("a[title]").text
    #all the titles in one string
    doc.search().first.attr("href")
    doc.at_css('td:contains("1.")').text.gsub(/\W/,'').split(" ")
    ("\s")
##########
    array = []
    object = doc.css("a[title]")

    object.each do |element|
      array << element.text
    end

    array.pop(6)
    array.shift(7)

    0 first
    249 last


    #type in a movie, checks if it is on imdb top 250 list
      #if it is, you can request to see more info or go back/exit
      <<-HEREDOC

      Please enter a number for each selection:
      1. List Top Movies
      2. Search by Name or Rank
      3. Exit
      HEREDOC


good resoure:
https://stackoverflow.com/questions/39653384/how-to-extract-links-and-link-text-from-html-using-nokogiri
