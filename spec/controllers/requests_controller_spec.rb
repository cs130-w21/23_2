# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RequestsController, type: 'controller' do
  describe '#create' do
    it 'successful creation of request' do
      req = create(:request)
      expect(req).to be_valid
    end
  end
end
