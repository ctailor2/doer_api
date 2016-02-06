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

require 'rails_helper'

RSpec.describe SessionToken, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
