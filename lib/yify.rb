require "yify/version"
require "net/http"
require "uri"
require "json"
require 'ostruct'
require 'active_support/core_ext/hash'

module Yify

	@uri = 'http://yts.to/api/v2/list_movies.json?fill=false'

	def self.limit(limit)
		@uri = "#{@uri}&limit=#{self.sanitize(limit)}"
		return self
	end

	def self.page(page)
		@uri = "#{@uri}&page=#{self.sanitize(page)}"
		return self
	end

	def self.quality(q)
		@uri = "#{@uri}&quality=#{self.sanitize(q)}"
		return self
	end

	def self.minimum_rating(m)
		@uri = "#{@uri}&minimum_rating=#{self.sanitize(m)}"
		return self
	end

	def self.genre(g)
		@uri = "#{@uri}&genre=#{self.sanitize(g)}"
		return self
	end

	def self.sort_by(s)
		@uri = "#{@uri}&sort_by=#{self.sanitize(s)}"
		return self
	end

	def self.order_by(o)
		@uri = "#{@uri}&order_by=#{self.sanitize(o)}"
		return self
	end

	def self.search(query)
		@uri = "#{@uri}&query_term=#{self.sanitize(query)}"
		return self
	end

	def self.with_rt_ratings(rt)
		@uri = "#{@uri}&with_rt_ratings=#{self.sanitize(rt)}"
		return self
	end

	def self.go
		uri = URI.parse(@uri)
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
		response = JSON.parse(response.body)
		response = OpenStruct.new(response["data"])
		count = 0
		response.movies.each do |movie|
			response.movies[count] = OpenStruct.new(movie)
			count += 1
		end
		@uri = 'http://yts.to/api/v2/list_movies.json?fill=false'
		response
	end

	def self.reset_uri
		@uri = 'http://yts.to/api/v2/list_movies.json?fill=false'
		return self
	end

	def self.sanitize(input)
		input.gsub('=','%3D').gsub('+','%2B').gsub(',','%2C').gsub(' ','%20')
	end

	def self.movie(id)
		@uri = "http://yts.to/api/v2/movie_details.json?movie_id=#{id}&with_images=true"
		uri = URI.parse(@uri)
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		response = http.request(request)
		response = JSON.parse(response.body)
		response = OpenStruct.new(response["data"])
		@uri = 'http://yts.to/api/v2/list_movies.json?fill=false'
		response
	end
end
