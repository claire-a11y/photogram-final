# == Schema Information
#
# Table name: follow_requests
#
#  id           :bigint           not null, primary key
#  status       :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer          not null
#  sender_id    :integer          not null
#
# Indexes
#
#  index_follow_requests_on_recipient_id  (recipient_id)
#  index_follow_requests_on_sender_id     (sender_id)
#
class FollowRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"

  validates :status, presence: true, inclusion: { in: %w[pending accepted rejected] }
end
