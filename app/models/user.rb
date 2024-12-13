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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_secure_password

  # 其他关联和验证
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :photos, foreign_key: :owner_id, dependent: :destroy
  has_many :sent_follow_requests, class_name: "FollowRequest", foreign_key: :sender_id, dependent: :destroy
  has_many :received_follow_requests, class_name: "FollowRequest", foreign_key: :recipient_id, dependent: :destroy
  has_many :followings, through: :sent_follow_requests, source: :recipient
  has_many :followers, through: :received_follow_requests, source: :sender

  def following?(user)
    followings.include?(user)
  end
end
