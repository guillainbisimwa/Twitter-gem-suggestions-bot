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
    tweets = @client.user_timeline('@RubygemsN', count: 8, since_id: 1_319_379_892_555_845_632) # max_id
    tweets.each { |tweet| puts tweet.full_text }

  end

  def text_
    hash2 = {
      '1319589468660092928' => 'paxful_engine-rails (0.2.0): Mountable engine that fetches completed paxful trades. https://t.co/Qpg6vbu23h',
      '1319589118129569798' => 'evideo (0.2.7): Processa ficheiros video. Pode alterar bitrate, framerate, height, aspect ratio e elimina metadata. https://t.co/RaUaC7o90Z',
      '1319587560939638784' => 'markdoc (1.2.1): Markdown with support for pseudocode to flowchart and sequence diagram generation https://t.co/O5sE8tCUi7',
      '1319583142785658880' => 'ruby-fire (0.2.2): This rubygem does not have a description or summary. https://t.co/NZcVX3enxa',
      '1319582076664905728' => 'xoptparse (0.6.2): This rubygem does not have a description or summary. https://t.co/RMkR82uSRJ'
    }

    hash2['1232141414'] = "Guillain"

    hash2.each_with_index do |(_key, val), _index|
      v = val
      #v = v.split(/.\d\d\d/)
      v = v.split("https")

      puts "#{v} \n\n"
    end
  end

  def post_random_tweet; end

  def check_if_tweeted?(tweet_id)
    false if tweet_id
  end

  def test
    tweets = @client.user_timeline('@RubygemsN', count: 5, since_id: 1_319_379_892_555_845_632) # max_id
    tweets.each { |tweet| puts " '#{tweet.id}' : '#{tweet.full_text}'" }
  end
end

r = RubyOnTwitter.new
r.text_
