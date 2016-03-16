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

class Todo < ActiveRecord::Base
  belongs_to :user

  alias_method :saved, :persisted?

  class Entity < Grape::Entity
    expose :task, :saved
  end
end
