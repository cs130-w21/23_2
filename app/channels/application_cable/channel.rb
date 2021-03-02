# frozen_string_literal: true

# The ApplicationCable class inherits from ActionCable, which provides web sockets for server-client communication.
module ApplicationCable
  # The channel class allows clients to choose to receive information from the server.
  class Channel < ActionCable::Channel::Base
  end
end
