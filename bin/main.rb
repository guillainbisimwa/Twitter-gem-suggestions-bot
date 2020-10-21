#!/usr/bin/env ruby
# frozen_string_literal: true

require 'twitter'
require_relative '../lib/config.rb'

key_words = ['I am a Test message', 'Test message every where']

2.times do
  # client.update(key_words.sample)
  puts 'Test'
  # sleep(2.minutes)
end

# client.search('bug').take(3).each do |tweet|
#   client.update("@#{tweet.user.screen_name} hey how are you bug?")
# end
