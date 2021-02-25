# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
end
