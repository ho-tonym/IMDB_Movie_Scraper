## Usage
I wrote a blogpost about Nokogiri scraping here: https://medium.com/@ho.tonym/scraping-with-nokogiri-in-7-steps-1b81a9ad2f3

This CLI application scrapes the IMDB website to provide the a list of the top movies. You can input the name correlated with the movie in order to get more information on the movie.

Movie Details include:
1. Rank
2. Title
3. Year of Release Date
4. IMDB rating
5. Director
6. Genres
7. Plot Summary
8. Gross USA
9. Gross WorldWide

# ImdbMovies

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/imdb_movies`. To experiment with that code, run `bin/console` for an interactive prompt.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'imdb_movies'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install imdb_movies


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ho-tonym/imdb_movies.

## License

The gem is available as open source under the terms of the [The Unlicense License](http://unlicense.org).
