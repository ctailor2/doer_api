# == Schema Information
#
# Table name: todos
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  position   :integer          not null
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
  acts_as_list scope: :user, top_of_list: 0

  class Entity < Grape::Entity
    expose :id, :task, :position
  end
end
