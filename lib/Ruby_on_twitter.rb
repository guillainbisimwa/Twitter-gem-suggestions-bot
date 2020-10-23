#!/usr/bin/env ruby
# frozen_string_literal: true

require 'dotenv/load'
require 'twitter'

class RubyOnTwitter
  attr_reader :hash_100_tweet, :hash_help_dev, :id_tweeted

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end

    @stream = Twitter::Streaming::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def fetch_100_tweet
    tweets = @client.user_timeline('@RubygemsN', count: 50) # max_id, since_id
    @hash_100_tweet = {}

    tweets.each do |tweet|
      @hash_100_tweet[tweet.id.to_s] = format_text(tweet.full_text) unless tweet.id.nil?
    end
  end

  def format_text(tweet)
    v = tweet.gsub(/ \(.*\): /, '***')
    v = v.gsub(/ https/, '***https')
    formated_tweet = v.split('***')
    formated_tweet
  end

  def text_
    @hash_100_tweet.each_with_index do |(_k, v), _index|
      puts "#{v} \n\n"
    end
  end

  def post_random_tweet
    hash_100_tweet = @hash_100_tweet.to_a.sample
    @client.update("A gem for you! ##{hash_100_tweet[1][0]}, #{hash_100_tweet[1][1]}")
  end

  def test
    tweets = @client.user_timeline('@RubygemsN', count: 5, since_id: 1_319_379_892_555_845_632) # max_id
    tweets.each { |tweet| puts " '#{tweet.id}' : '#{tweet.full_text}'" }
  end
end

r = RubyOnTwitter.new
r.fetch_100_tweet
#r.text_
r.post_random_tweet
