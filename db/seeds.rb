require "json"
require "open-uri"

puts "Start movies generating"
url = "https://tmdb.lewagon.com/movie/top_rated"
items = JSON.parse(URI.open(url).read)["results"]

items.each { |item|
  movie = Movie.new
  movie.title = item["title"]
  movie.overview = item["overview"]
  movie.rating = item["vote_average"]
  movie.poster_url = "https://image.tmdb.org/t/p/w500#{item["poster_path"]}"
  movie.save
}
puts "End movies generating"
