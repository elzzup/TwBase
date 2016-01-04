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
end