# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  timezone        :string           default("Etc/UTC"), not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :session_tokens
  has_many :todos, -> { order(position: :asc) }

  validates :email, uniqueness: true

  accepts_nested_attributes_for :todos, update_only: true

  def count_of_todos_completed_today
    # This adds some weight to the initial page load
    # I wonder if shipping it off to a diff API call makes sense
    today = DateTime.now.utc.in_time_zone(timezone).to_date
    # Using updated at may not be the most accurate if todos can be uncompleted.
    # Maybe now is the time to consider adding a grace period with undo feature.
    todos.completed.where('(updated_at::timestamptz AT TIME ZONE ?)::date = ?', timezone, today).count
  end

  class Entity < Grape::Entity
    expose :email, :timezone
    expose :todos, using: Todo::Entity, if: -> (instance, options) do
      with_assocs = options['with_assocs']
      with_assocs && with_assocs.include?('todos')
    end
    expose :count_of_todos_completed_today, as: :completed
  end
end
