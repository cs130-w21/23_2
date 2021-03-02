# frozen_string_literal: true

# This class defines a request, which is linked to a specific chatroom and user.

class Request < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
end
