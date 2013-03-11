#!/usr/bin/env ruby -wKU

DICTIONARY_FILE = File.expand_path("~/Downloads/6of12.txt")
MIN_LENGTH = 10
WORDS = File.read(DICTIONARY_FILE).split(/\r?\n/)
WORDS_BY_LETTER = WORDS.reject {|ea| ea =~ /[^a-z]/i || ea.size < MIN_LENGTH }.group_by {|ea| ea.split("").first.downcase }

WORDS_BY_LETTER.keys.sort.each {|letter| puts "#{letter}: #{WORDS_BY_LETTER[letter].size} words"}

abort "Cannot find dictionary." unless File.exist?(DICTIONARY_FILE)

def get_elevator_message(letter)
  elevator_word = WORDS_BY_LETTER[letter].choice
  direction = ["right", "left"].choice
  position = ["", "and behind"].choice
  %Q|say -v Samantha -r 160 "Elevator #{letter.upcase}, like '#{elevator_word}', arriving to your #{direction} #{position}"|
end

if ARGV.include?("-i")
  while true
    print "Which elevator is arriving? "
    letter = STDIN.gets.strip.downcase
    `#{get_elevator_message(letter)}`
  end
else
  while true
    `#{get_elevator_message(WORDS_BY_LETTER.keys.choice)}`
    sleep(rand * 1.5)
  end
end