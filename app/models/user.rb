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

  class Entity < Grape::Entity
    expose :email, :timezone
    expose :todos, using: Todo::Entity
  end
end
