# frozen_string_literal: true

class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :requests
  has_many :messages
  validates :title, presence: true
end
