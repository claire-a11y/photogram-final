# == Schema Information
#
# Table name: photos
#
#  id             :bigint           not null, primary key
#  caption        :text
#  comments_count :integer          default(0)
#  image          :string           not null
#  likes_count    :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer          not null
#
# Indexes
#
#  index_photos_on_owner_id  (owner_id)
#
class Photo < ApplicationRecord
  belongs_to :user, foreign_key: :owner_id
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :image, presence: true
  validates :caption, presence: true

  scope :public_photos, -> { joins(:user).where(users: { private: false }) }

  def fans
    likes.map(&:user)
  end
end
