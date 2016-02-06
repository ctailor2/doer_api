# == Schema Information
#
# Table name: client_tokens
#
#  active     :boolean          default(TRUE), not null
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  label      :string           not null
#  token      :string           not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_client_tokens_on_token  (token) UNIQUE
#

class ClientToken < ActiveRecord::Base
  include Token
end

