class Setting::Goal < ActiveRecord::Base
  belongs_to :user

  class Entity < Grape::Entity
    expose :target, :updated_at
  end
end
