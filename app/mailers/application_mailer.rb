# frozen_string_literal: true

# This class allows emails to be sent from the application. Not currently being used.

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
