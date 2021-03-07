# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: 'controller' do
  describe '#show' do
    it 'response successful' do
      expect(response).to be_successful
    end
  end
end
