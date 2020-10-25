#!/usr/bin/env ruby
# frozen_string_literal: true

require '../lib/RubyOnTwitter'

puts "\n                 RUBY GEM SUGGESTIONS BOT"
puts "                 ########################\n\n"
puts "               https://twitter.com/RomoteB\n".pink

puts 'Welcome to a Twitter bot that posts inspirational gem suggestions
    and tags ruby developer who needs help while developing in ruby'.light_blue

puts "\n      It can be triggered on the command line/terminal.\n".red

puts "                 ----- Let' go -----\n".blue

ruby_twitter = RubyOnTwitter.new
try_count = 0

loop do
  puts 'Make a choice : '
  print '1) '.yellow
  puts 'Post on Twitter a random gem suggestion.'
  print '2) '.yellow
  puts 'Look for recent tweets asking for help about ruby development using our list of #'
  print '3) '.yellow
  puts 'Exit '

  choise = gets.chomp.to_i
  case choise
  when 1

    ruby_twitter.fetch_100_tweet
    puts ruby_twitter.post_random_tweet.green

    puts "\nYou have successfully generated a post, go on Twitter and check for it\n".blue

    break

  when 2

    puts "We will like and follow the latest tweets that have one the hashtags : \n\n"
    print '#code_quality_gem_suggest, '.yellow
    print '#testing_gem_suggest, '.light_blue
    print '#debugging_gem_suggest, '.yellow
    print '#deployment_gem_suggest, '.light_blue
    print '#authentication_gem_suggest, '.yellow
    puts '#authorization_gem_suggest, '.light_blue
    print '#uploading_files_gem_suggest, '.yellow
    print '#upload_files_gem_suggest, '.light_blue
    print '#search_gem_suggest, '.yellow
    print '#admin_gem_suggest, '.light_blue
    puts '#admin_panels_gem_suggest'.yellow
    puts "\nWe will also suggest a useful gem for any of your choices."

    puts "Please go to Twitter and post a tweet, see the example below : \n\n"
    puts '``I want to know how to upload files in ruby #upload_files_gem_suggest``'.blue

    puts "\nHave you posted? (yes) (no)"
    choice_status = gets.chomp.to_s.upcase
    case choice_status
    when 'YES'
      ruby_twitter.mode_hepl_needed_tweet
      ruby_twitter.catch_help_needed_tweet
      puts "\nTHANKS, go and check our reply to your tweet, we'll tag you and suggest a gem for you ".green

    when 'NO'
      puts "We don't have anything for you! Bye bye".red
    else
      puts "\nBad choice!!!, go to the begining".red
      next
    end

    break
  when 3
    print '3'
    break
  else
    puts 'Error! Retry again'.red
    try_count += 1
    if try_count == 3
      puts 'You have tried 3 times'.red
      break
    end
    next
  end
end
