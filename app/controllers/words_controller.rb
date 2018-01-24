class WordsController < ApplicationController
  def index

    ### OBJECTIVE: create a list of the top 100 most frequently occurring words (excluding stop words) paired with the count occurrence of the word in the text of Moby Dick.

    # import files. Drop the lines that are not part of the actual text.
    p '*' * 50
    unrefined_text_array = []
    path_text = Rails.root.join('public', 'mobydick.txt')
    File.open(path_text) do |f|
      p unrefined_text_array = f.drop(349).take(21948)
    end
    p '*' * 50

    p 'X' * 50
    unrefined_stop_words_array = []
    path_stop_words = Rails.root.join('public', 'stop-words.txt')
    File.open(path_stop_words) do |f|
      p unrefined_stop_words_array = f.drop(12)
    end
    p 'X' * 50


    ###################### BEGIN STOP_WORDS FILTERING ########################

    # refine the stop words array so that we only have a list of words.
    refined_stop_words = []

    unrefined_stop_words_array.each do |stop_word|
      chomped_word = stop_word.chomp
      if !chomped_word.empty?
        refined_stop_words << chomped_word
      end
    end

    ###################### END STOP_WORDS FILTERING ##########################


    ######################## BEGIN TEXT FILTERING ############################

    # To list a word with its frequency number, we pair them together in a hash.
    frequency = Hash.new(0)

    # Next we loop through the hash to get individual words.

    # unrefined_text_array is an array of strings.
    unrefined_text_array.each do |words_string|
      # words_string is a string of many words.
      words_string.split(/\s+/).each do |word|
        # word is a string of just one word.
        # take out punctuations on the words and downcase.
        pure_alphabet_word = word.gsub(/[[:punct:]]/, '').downcase
        # increase the frequency of the word each time it appears.
        frequency[pure_alphabet_word] += 1
      end
    end

    ### IMPORTANT: this is not an entirely accurate filter. Words that are hyphenated with other words are now one word, E.g. the string "main-truck—'Ha!" now becomes "maintruckha"


    ######################## END TEXT FILTERING ##############################


    ############ BEGIN TEXT TO STOP_WORDS COMPARISON AND SORTING #############

    # Create a new array that will hold the top 100 frequently occurring words.
    top_100_frequent_words = []

    # For each element of the hash, we want to determine if it's a stop word or if the word is an empty string. If yes, then we delete it.
    no_stop_word_hash = frequency.each { |k, _| frequency.delete(k) if refined_stop_words.include?(k) || k == "" }

    # Now we sort the clean hash by reversing the order of the first hundred words from ascending to descending.
    no_stop_word_hash.sort_by { |_k, v| v }.reverse[0..99].each do |k, v|
      # Here we translate the hash into strings to be shoved in the top_100_frequent_words array.
      top_100_frequent_words << "#{k}: #{v}"
    end

    ############ END TEXT TO STOP_WORDS COMPARISON AND SORTING ###############

    @words = top_100_frequent_words
    
    render "index.html.erb"
  end
end
