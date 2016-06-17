# == Schema Information
#
# Table name: setting_goals
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  target     :integer          default(2), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_setting_goals_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Setting::Goal, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
