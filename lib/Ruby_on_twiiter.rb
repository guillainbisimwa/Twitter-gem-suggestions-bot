#!/usr/bin/env ruby
# frozen_string_literal: true

require 'dotenv/load'
require 'twitter'

class RubyOnTwitter
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

  def test
    tweets = @client.user_timeline('@RubygemsN', count: 2, since_id: 1319379892555845632) #max_id
    tweets.each { |tweet| puts tweet.full_text } 
  end
end

r = RubyOnTwitter.new
r.test
