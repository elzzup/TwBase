# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  tweet_id   :string
#  text       :string
#  user_id    :integer
#  lat        :float
#  long       :float
#  for_sq     :boolean
#  keyword    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ActiveRecord::Base
  belongs_to :user
end
