# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  task       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#  completed  :boolean          default(FALSE), not null
#  active     :boolean          default(FALSE), not null
#
# Indexes
#
#  index_todos_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Todo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
