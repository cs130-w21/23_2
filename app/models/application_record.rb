# frozen_string_literal: true

# This class defines an application record.

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
