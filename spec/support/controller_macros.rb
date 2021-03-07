# frozen_string_literal: true

module ControllerMacros
  def login
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      u = FactoryBot.create(:user)
      sign_in u
    end
  end
end
