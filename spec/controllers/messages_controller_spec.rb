# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: 'controller' do
  describe '#create' do
    it 'valid message' do
      mess = create(:message)
      expect(mess).to be_valid
    end
    it 'valid message contents' do
      mess = create(:message, body: 'sample message')
      expect(mess.body).to eq('sample message')
    end
  end
end
