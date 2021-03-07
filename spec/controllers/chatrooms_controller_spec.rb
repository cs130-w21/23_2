# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatroomsController, type: 'controller' do
  describe '#index' do
    login
    before do
      get :index
    end
    it 'index is set up correctly' do
      # status 200 = ok
      expect(response).to have_http_status(200)
      # render_template is broken in this version of ruby. Sad.
      # render_template tests the template made by index
      # expect(response).to render_template(:index)
    end
  end
  describe '#create' do
    login
    it 'successfully create a chatroom' do
      room = create(:chatroom)
      expect(room).to be_valid
    end
    it 'edit chatroom parameters' do
      room = create(:chatroom,  title: 'Title',
                                details: 'This is a chatroom test case',
                                gender: 'Male Only',
                                collegestudent: 'No College Student',
                                minimumage: 30,
                                maximumage: 40,
                                visible: true,
                                city: 'Los Angeles,United States,California,5368361')
      expect(room.title).to eq('Title')
      expect(room.details).to eq('This is a chatroom test case')
      expect(room.gender).to eq('Male Only')
      expect(room.collegestudent).to eq('No College Student')
      expect(room.minimumage).to eq(30)
      expect(room.maximumage).to eq(40)
      expect(room.visible).to eq(true)
      expect(room.city).to eq('Los Angeles,United States,California,5368361')
    end
  end
  describe '#show' do
  end
end
