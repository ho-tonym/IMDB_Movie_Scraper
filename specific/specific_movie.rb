class SpecificMovie #Object

attr_accessor :title, :rank, :release_date, :rating, :url

  def self.top_movies
    self.scrape
  end

  def self.scrape
    #top movies url https://www.imdb.com/chart/top?ref_=nv_mv_250_6
    movies_array = []
    movies_array << self.scrape_top_movies

    movies_array
  end

  def self.scrape_top_movies
    doc = Nokogiri::HTML(open("https://www.imdb.com/title/tt0111161/?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=e31d89dd-322d-4646-8962-327b42fe94b1&pf_rd_r=JGBBC8C28H7DFQEM8NFH&pf_rd_s=center-1&pf_rd_t=15506&pf_rd_i=top&ref_=chttp_tt_1"))
    binding.pry
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
    #
    # doc.css("td.titleColumn").text.split(/\n+/)
    #
    # :rank, :release_date, :rating, :url
    doc.at_xpath("//a[@title]")
    doc.css("a[title]").text
    #all the titles in one string


    #type in a movie, checks if it is on imdb top 250 list
      #if it is, you can request to see more info or go back/exit
  end
end
#
# #########
# #too general
# # text associated with that value
# # doc.at_css('a:contains("Godfather")')
#
# SEARCH BY NAME
# more specific?
# movie = doc.at_xpath('//a[text()="Godfather"]')
# movie["title"]
# movie["href"]
#
# SEARCH BY RANK
# doc.at_css('td:contains("1.")')
# first rank
# doc.at_css('td:contains("1.")').text
#
# doc.at_css('td:contains("6.")').text.split("\s")
# rank = [0]
# year it came out = [-1]
#
# title = remove first array element, last, join by a " "
#
# GET MORE INFO
# take title, pass it to
# movie = doc.at_xpath('//a[text()="Godfather"]')
# scrape = https://www.imdb.com/  movie["href"]
# ##########


# 5. Director
# doc.at_xpath('//span[@class="itemprop"]').text
# 6. Writers
# 7. Main Actors
# 8. Plot Summary
# 9. Gross USA
# 10. Gross WorldWide

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
