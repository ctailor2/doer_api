# == Schema Information
#
# Table name: todos
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  task       :string           not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Todo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
