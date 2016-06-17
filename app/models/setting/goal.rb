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

class Setting::Goal < ActiveRecord::Base
  belongs_to :user

  def updated_today?
    updated_at.in_time_zone(user.timezone).to_date == ActiveSupport::TimeZone[user.timezone].today
  end

  class Entity < Grape::Entity
    expose :target, :updated_today?
  end
end
