# frozen_string_literal: true

# This class defines a chatroom, which has chatroom users, requests, and messages.

class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :requests
  has_many :messages
  validates :title, presence: true
end
