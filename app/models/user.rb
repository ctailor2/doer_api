# == Schema Information
#
# Table name: users
#
#  created_at      :datetime         not null
#  email           :string           not null
#  id              :integer          not null, primary key
#  password_digest :string           not null
#  updated_at      :datetime         not null
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

  class Entity < Grape::Entity
    expose :email
  end
end
