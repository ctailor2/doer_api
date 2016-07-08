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

class Setting::Pipeline < ActiveRecord::Base
  belongs_to :user

  validate :restrict_viewing

  def mark_as_viewed!
    update_attributes!(last_viewed_at: DateTime.now.utc)
  end

  def cannot_view?
    user_timezone = ActiveSupport::TimeZone[user.timezone]
    today = user_timezone.now.to_date
    last_viewed_at_date = user_timezone.at(last_viewed_at.to_i).to_date
    today - last_viewed_at_date < days_between_views
  end

  private

  def restrict_viewing
    if last_viewed_at_changed? && cannot_view?
      errors[:last_viewed_at] << 'cannot be updated when the pipeline cannot be viewed'
    end
  end

  class Entity < Grape::Entity
    expose :days_between_views, :cannot_view?
  end
end
