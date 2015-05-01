# Yify

This is a simple and easy Ruby wrapper for [YIFY's](https://yts.to/browse-movies) API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yify', github: 'juangesino/yify' 
```

And then execute:

    $ bundle

## Usage

```ruby
# Use methods to generate your query:
y = Yify.parameter_method('YOUR-PARAMETER-VALUE').other_parameter_method('YOUR-OTHER-PARAMETER-VALUE')     

# Send the query and get a response:
r = y.go
```

## Example

```ruby
# Create an object with the parameters you want:    
y = Yify.search('Social')   

# Now get the response:   
r = y.go

# How many matches for that search?   
r.movie_count
# => 3    

# So let's print the names of the movies:   
r.movies.each do |movie|
	puts movie.title_long
end
# => "Antisocial (2013)"
# => "Social Nightmare (2013)"
# => "The Social Network (2010)"    
    
# All in one line:    
Yify.search('Social Network').go.movies.first.title_long
# => "The Social Network (2010)"    
```   

For a list of parameters check the [API docs](https://yts.to/api)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Details

Created by [Juan Gesino](https://github.com/juangesino)

## Contributing

1. Fork it ( https://github.com/educatea/educatea/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request