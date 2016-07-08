# == Schema Information
#
# Table name: setting_pipelines
#
#  id                 :integer          not null, primary key
#  user_id            :integer          not null
#  days_between_views :integer          default(2), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  last_viewed_at     :datetime
#
# Indexes
#
#  index_setting_pipelines_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Setting::Pipeline, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
