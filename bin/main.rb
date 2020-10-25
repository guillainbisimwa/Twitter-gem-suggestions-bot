#!/usr/bin/env ruby
# frozen_string_literal: true

require '../lib/RubyOnTwitter'

puts "\n                 RUBY GEM SUGGESTIONS BOT".red
puts "                 ########################\n".red
puts "               https://twitter.com/RomoteB\n".pink

puts 'Welcome to a twitter bot that posts inspirational gem suggestions
 and tags ruby developer who need help while developping in ruby'.light_blue

puts "\n      It can be triggered on the command line/terminal.\n".red

puts "                 ----- Let' go -----\n".blue

ruby_twitter = RubyOnTwitter.new
try_count = 0

loop do
  puts 'Make a choice: '
  print '1) '.yellow
  puts 'Post on twitter a random gem suggestion.'
  print '2) '.yellow
  puts 'Look for recents tweets asking help about ruby develpment'
  print '3) '.yellow
  puts 'Exit '

  choise = gets.chomp.to_i
  case choise
  when 1

    ruby_twitter.fetch_100_tweet
    puts ruby_twitter.post_random_tweet.green

    puts "\nYou have successfully generate a post, go on twitter and check for it\n".blue

    break

  when 2
    print '#code_quality, '.yellow
    print '#testing, '.yellow
    print '#debugging, '.yellow
    print '#deployment, '.yellow
    print '#authentication, '.yellow
    print '#authorization, '.yellow
    print '#uploading_files, '.yellow
    print '#upload_files, '.yellow
    print '#search, '.yellow
    print '#admin, '.yellow
    puts '#admin_panels'.yellow

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

