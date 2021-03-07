require 'rails_helper'

RSpec.describe RequestsController, :type => :controller do
    
    describe '#create' do
        it 'successful creation of request' do
            req = create(:request)
            expect(req).to be_valid
        end
    end
    
    """
    describe '#destroy' do
        let(:request) { FactoryBot.create(:request) }
        before do
            request
        end
        it 'successful deletion of request' do
            #req = create(:request)
            #delete :destroy_all, :id request
            expect { delete :destroy_all, params: {:id => request.id} }.to_not change(Request, :count)
            #expect { delete :destroy_all, :id request }.to change(Request, :count).by(-1)
        end
    end
    """
    
end