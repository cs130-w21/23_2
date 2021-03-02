# frozen_string_literal: true

# This class defines a message, which is linked to a specific chatroom and user.

class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
end
