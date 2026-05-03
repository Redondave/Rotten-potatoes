require 'uri'
require 'net/http'

module MoviesHelper
end

def active_class(column)
  class_names('col -8', 'col -2', 'sorted' => params[:sort] == column)
end

def find_in_tmdb(search_terms)
  api_key = ENV['TMDB_API_KEY']
  url = URI("https://api.themoviedb.org/3/search/movie?query=#{search_terms}")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzMmIyNGQ1NTU0NDUxZGQzYTgxNjZhMWMwNjljNjk5ZSIsIm5iZiI6MTc3NzU1ODMwNy45MDMsInN1YiI6IjY5ZjM2MzIzOTU4YTBhYzlhN2I3MjE4MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NC_8rfAAugntdCOEqRVafVyNeIRz-Hh6ctKwdmLvPR4'
  response = http.request(request)
  JSON.parse(response.body)['results']
end