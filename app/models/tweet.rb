# == Schema Information
#
# Table name: tweets
#
#  id           :integer          not null, primary key
#  tweet_id     :string
#  text         :string
#  user_id      :integer
#  lat          :float
#  long         :float
#  for_sq       :boolean
#  text_keyword :string
#  search_word  :string
#  tweeted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_tweets_on_created_at  (created_at)
#  index_tweets_on_tweeted_at  (tweeted_at)
#  index_tweets_on_user_id     (user_id)
#

class Tweet < ActiveRecord::Base
  belongs_to :user

  def self.oldest_tweet
    Tweet.order(:tweeted_at).first
  end

  def self.day_count(word)
    tweets = Tweet.where(search_word: word).order(:tweeted_at)
    start_time = tweets.first.tweeted_at
    last_time = tweets.last.tweeted_at
    (start_time.to_date..last_time.to_date).each do |date|
      count = Tweet.where(tweeted_at: date.beginning_of_day..date.end_of_day).size
      puts "#{date} - #{count} tweets"
    end
  end
end
