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

class Todo < ActiveRecord::Base
  belongs_to :user
  acts_as_list scope: :user, top_of_list: 0, add_new_at: nil

  class Entity < Grape::Entity
    expose :id, :task, :position, :active
  end
end
