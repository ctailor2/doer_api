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

  class Entity < Grape::Entity
    expose :task
  end
end
