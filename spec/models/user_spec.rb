# == Schema Information
#
# Table name: users
#
#  created_at      :datetime         not null
#  email           :string           not null
#  id              :integer          not null, primary key
#  password_digest :string           not null
#  timezone        :string           default("Etc/UTC"), not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
