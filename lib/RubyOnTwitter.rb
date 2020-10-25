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
    @hash_help_dev.each_with_index do |(_k, v), _index|
      puts "#{v} \n\n"
    end
  end

  def post_random_tweet
    hash_100_tweet = @hash_100_tweet.to_a.sample
    @client.update("A gem for you! ##{hash_100_tweet[1][0]}, #{hash_100_tweet[1][1]} #{hash_100_tweet[1][2]}")
  end

  def mode_hepl_needed_tweet
    @hash_help_dev = {}

    @hash_help_dev['code_quality'] = [
      '#rubocop is a tool for analyzing and formatting Ruby static code.',
      '#overcommit is a gem for configuring Git hooks. It allows tuning git hooks for linters launch before
      every commit'
    ]

    @hash_help_dev['debugging'] = [
      '#better_errors displays helpful information about an error and has an excellent visual impact.',
      '#byebug allows line-by-line fulfillment of code, pausing between tasks, and executing code,
      changing the variables on the move.'
    ]

    @hash_help_dev['testing'] = [
      '#RSpec suggests Behaviour Driven Development for Ruby. ',
      '#Capybara is an acceptance test framework for web applications. It flawlessly runs in tandem with RSpec.',
      '#Capybara Screenshot : is a Ruby gem for automatic saving of screenshots if a Capybara scenario breaks down. ',
      '#Parallel_tests makes tests written in TestUnit, RSpec and Cucumber pass faster running them in parallel
      on multiple CPUs.',
      '#Factory Bot is a library for setting up Ruby objects as test data.',
      '#Chromedriver_helper provides easy installation and use of chromedriver.',
      '#Shoulda Matchers is a Ruby gem providing simple one-liner tests for common Rails functionality
      which accelerates writing the tests for a typical capacity.',
      '#Simplecov is one of the useful gems for testing. ',
      '#DatabaseCleaner provides code coverage with a powerful configuration library and automatic
      merging of coverage across test suites.',
      '#RSpec:: Retry is a tool that provides: retry randomly failing RSpec example.',
      '#Faker is a library for generating demo data such as names, addresses, and phone numbers.'
    ]

    @hash_help_dev['deployment'] = [
      '#Mina is a fast deployer and server automation tool. It generates an entire procedure as a Bash script
      and runs it remotely in the server.'
    ]

    @hash_help_dev['authentication'] = @hash_help_dev['authorization'] = [
      '#Devise is a flexible authentication solution for Rails based on Warden',
      '#Ruby-JWT gem is a simple Ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.',
      '#CanCanCan is a super-convenient authorization Ruby gem.',
      '#OmniAuth is a flexible authentication system utilizing Rack middleware'
    ]

    @hash_help_dev['uploading_files'] = @hash_help_dev['upload_files'] = [
      '#Carrierwave is an excellent solution for file uploading and processing for Rails',
      '#Carrierwave_backgrounder works with carrierwave. It allows moving image processing or compressing
      into the background.',
      '#MiniMagick this Ruby gem allows reducing Ruby processes memory.
      It makes available all the command-line options of ImageMagick.'
    ]

    @hash_help_dev['search'] = [
      'Elasticsearch is a popular search system widely used in enterprises.'
    ]

    @hash_help_dev['admin'] = hash_help_dev['admin_panels'] = [
      'Activeadmin is the administration framework for Ruby on Rails applications.
      The plugin allows generating administration style interfaces.',
      'Administrate is a Rails engine. It helps construct a user-responsive admin dashboard.'
    ]
  end

  def catch_help_needed_tweet; end

  def help_a_tweet; end
end
