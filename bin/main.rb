#!/usr/bin/env ruby

require './config'

key_words = ['I am a bugs', 'Bugs every where']

2.times do
  client.update(key_words.sample)
  sleep(2.minutes)
end

client.search('bug').take(3).each do |tweet|
  client.update("@#{tweet.user.screen_name} hey how are you bug?")
end
