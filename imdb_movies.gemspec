lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "imdb_movies/version"

Gem::Specification.new do |spec|
  spec.name          = "imdb_movies"
  spec.version       = ImdbMovies::VERSION
  spec.authors       = ["ho-tonym"]

  spec.summary       = %q{IMDB Top 250 movies scraper!}
  spec.homepage      = "https://github.com/ho-tonym/IMDB_Movie_Scraper"
  spec.license       = "UNLICENSE"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "config", "bin"]

  spec.add_dependency "bundler", "~> 1.16"
  spec.add_dependency "rake", "~> 10.0"
  spec.add_dependency "rspec", "~> 3.0"
  spec.add_dependency "pry"
  spec.add_dependency "nokogiri"
end
