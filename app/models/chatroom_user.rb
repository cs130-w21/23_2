# frozen_string_literal: true

# This class defines a chatroom user, which is linked to a specific chatroom and user.

class ChatroomUser < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
end
