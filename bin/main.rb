#!/usr/bin/env ruby
# frozen_string_literal: true

require 'dotenv/load'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

stream = Twitter::Streaming::Client.new do |config|
  config.consumer_key = ENV['CONSUMER_KEY']
  config.consumer_secret = ENV['CONSUMER_SECRET']
  config.access_token = ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

client.search('#hirerubybot').take(1).each do |tweet|
  client.update("@#{tweet.user.screen_name} really ruby is alive!! https://isrubydead.com/ ")
end

# my topics to serach
topics = ['#ruby', '#hire', '#remote']
stream.filter(track: topics.join(',')) do |tweet|
  if tweet.is_a?(Twitter::Tweet)
    puts tweet.text
    # r_client.fav tweet
  end
end


tweets = client.user_timeline('@RubygemsN', count: 8, since_id: 1319379892555845632) #max_id
tweets.each { |tweet| puts tweet.full_text }

