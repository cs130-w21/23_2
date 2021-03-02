# frozen_string_literal: true

# This class is the superclass for all application features.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
