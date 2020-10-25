#!/usr/bin/env ruby
# frozen_string_literal: true

require '../lib/RubyOnTwitter'

puts "\nRUBY GEM SUGGESTIONS BOT".blue
puts "########################\n\n"

puts 'Welcome to a twitter bot that posts inspirational gem suggestions
and tags ruby developer who need help while developping in ruby'.light_blue

puts "\nIt can be triggered on the command line/terminal.".red


r = RubyOnTwitter.new
# r.fetch_100_tweet
r.mode_hepl_needed_tweet
# r.text_
# r.post_random_tweet
