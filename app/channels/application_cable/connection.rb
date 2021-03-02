# frozen_string_literal: true

module ApplicationCable
  # The connection class represents a socket accepted by the server and is the superclass for channel subscriptions.
  class Connection < ActionCable::Connection::Base
  end
end
