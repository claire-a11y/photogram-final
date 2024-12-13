# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer          default(0)
#  email                  :string           not null
#  encrypted_password     :string
#  likes_count            :integer          default(0)
#  private                :boolean          default(FALSE)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  has_many :photos, foreign_key: :owner_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :fan_id
  has_many :sent_follow_requests, class_name: "FollowRequest", foreign_key: :sender_id
  has_many :received_follow_requests, class_name: "FollowRequest", foreign_key: :recipient_id
end