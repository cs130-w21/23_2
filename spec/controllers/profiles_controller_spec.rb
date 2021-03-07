# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: 'controller' do
  describe '#create' do
    it 'successful creation of profile' do
      prof = create(:profile)
      expect(prof).to be_valid
    end
    it 'profile has correct values' do
      prof = create(:profile, first_name: 'Firstname', last_name: 'Lastname', collegeemail: 'test@ucla.edu', age: 42, gender: 'Female')
      expect(prof.first_name).to eq('Firstname')
      expect(prof.last_name).to eq('Lastname')
      expect(prof.collegeemail).to eq('test@ucla.edu')
      expect(prof.age).to eq(42)
      expect(prof.gender).to eq('Female')
    end
  end
end
