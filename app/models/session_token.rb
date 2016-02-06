# == Schema Information
#
# Table name: session_tokens
#
#  created_at :datetime         not null
#  expires_at :datetime         not null
#  id         :integer          not null, primary key
#  token      :string           not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_session_tokens_on_token    (token) UNIQUE
#  index_session_tokens_on_user_id  (user_id)
#

class SessionToken < ActiveRecord::Base
  include Token

  EXPIRATION_PERIOD = 1.month

  before_create :set_expiration

  belongs_to :user

  def expired?
    now >= expires_at
  end

  private

  def now
    DateTime.now.utc
  end

  def set_expiration
    self.expires_at = now + EXPIRATION_PERIOD
  end
end
