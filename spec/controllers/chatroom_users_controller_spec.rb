# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatroomUsersController, type: 'controller' do
  describe '#create' do
    it 'verify contents of chatroom user' do
      use = create(:user, email: 'joebruin@gmail.com', encrypted_password: 'noTrojans')
      expect(use.email).to eq('joebruin@gmail.com')
      expect(use.encrypted_password).to eq('noTrojans')
    end
  end
end
