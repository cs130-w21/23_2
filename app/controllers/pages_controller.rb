# frozen_string_literal: true

# This class renders the homepage of the current user.

class PagesController < ApplicationController
  # Find and display all chatrooms where the current user is a member.
  def home
    @user = User.find(current_user.id)
    if current_user.profile

      @chatrooms = Chatroom.all
      @results = []
      @chatrooms.each do |x|
        @results.push(x)
      end
      @unread = 0
      @requests = 0
    end
  end
end
