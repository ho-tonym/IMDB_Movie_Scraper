class Movie

attr_accessor :link, :title, :rank, :imdb_rating, :director, :genres,
:plot_summary, :gross_usa, :gross_world, :year_release

#Note to Howard:
# It would be more optimal to create the movie objects when the user requests it, rather then creating all 250 movie objects
# at the start of the application.

# @@movie_title_rank_h would hold an integer and a string value to display to the user
# and we would create movie objects stored  by their rank as the key in the @@movies hash which we will use to check
# if we have already scraped this object before. We could always have just 1 array/hash storing all the objects but I found
# the app takes less time to start up.

# Also at the beginning we scrape because if the user wants to enter a movie without pressing 1.
# and listing the movies first, the data would'nt be populated yet.

  @@movies = []
  #movie objects
  @@movie_title_rank_h = {}
  # key => ranking(int)
  # value => title(string)

  def self.all_movie_titles # allow cli to access info
    @@movie_title_rank_h
  end

  def self.all_movie_objects
    @@movies = []
  end

  def self.scrape # grab info
    titles_array = Scraper.scrape_top_250
    titles_array.each_with_index do |title, index|
      @@movie_title_rank_h[index + 1] = title
    end
  end

  def self.search_by_name(movie_name) # search by name, create movie object
    movie = self.new

    @@movies.each do |movie_title|  # check to see if the movie object is already in our array
      if movie_name == movie_title.title
        movie = movie_title
      end
    end
    if movie.title == nil
      Scraper.scrape_link(movie, movie_name)# if it isnt, we will find the link and scrape it
    else
      movie
    end
  end
end
