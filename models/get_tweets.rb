# This class handles connecting to the Twitter API. In Rack Todo, this lived in app.rb. Here's we've abstracted it out into its own class. This class we will then initialize in app.rb.

# Our Gemfile has the twitter gem and config/environment requires it through Bundler.

class GetTweets
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  TWITTER = Twitter::REST::Client.new do |config|
    # go to https://dev.twitter.com/apps and create your own twitter app. Then grab your keys and replace these ones
    config.consumer_key = "00tfQ0A7HlWvADGrYEExBk2Rb"
    config.consumer_secret = "QK0X8bMkOnAG9p7iVYYVS4hucYWF7vmUsTngMflqiKHQG2UEUd"
    config.access_token = "11042-ZVDQyo9NGF60rIB1XHC25ppksMku3vHgLqiqz6JHIZVW"
    config.access_token_secret = "xh3v09YexAUjvJVOjNSU3tsMAVk7T8yjc36DQL2VRS4pi"
  end

  def get_search_results
    twitter_search_results = []
    TWITTER.search(handle).each do |tweet|
      # we're saving the tweet user's name and the tweet text in an array of arrays
      twitter_search_results << [tweet.user.name, tweet.text]
    end
    twitter_search_results
  end

end
