# frozen_string_literal: true

# This class defines a user profile, which adds a profile picture to a user.

class Profile < ActiveRecord::Base
  belongs_to :user
  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: ':style/missing.jpg'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\Z}
end
