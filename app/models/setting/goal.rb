class Setting::Goal < ActiveRecord::Base
  belongs_to :user

  def updated_today?
    updated_at.in_time_zone(user.timezone).to_date == ActiveSupport::TimeZone[user.timezone].today
  end

  class Entity < Grape::Entity
    expose :target, :updated_today?
  end
end
