class WordsController < ApplicationController
  def index
    @words = "Herman Melville's Moby Dick"

    ### OBJECTIVE: create a list of the top 100 most frequently occurring words (excluding stop words) paired with the count occurrence of the word in the text of Moby Dick.

    # import files. Drop the lines that are not part of the actual text.
    p "*" * 50
    p path_text = Rails.root.join('public', 'mobydick.txt').class
    p path_stop_words = Rails.root.join('public', 'stop-words.txt').class
    p "*" * 50
  end
end
