# frozen_string_literal: true

# This class defines a user, which has a profile, chatroom, chatroom users, messages, and requests.

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :chatroom_users
  has_many :chatrooms, through: :chatroom_users
  has_many :messages
  has_many :requests
end
