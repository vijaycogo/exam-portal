require 'rails_helper'
require 'pry'
RSpec.describe EnrollUserController, type: :controller do
  describe 'POST #enroll_user' do
    context 'with invalid parameters' do
      it 'returns an error response' do
        post :enroll_user, params: {
          first_name: 'John', # Missing some required parameters
          college_id: 1,
          exam_id: 1
        }

        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['message']).to eq('Required parameters are missing')
      end
    end

    context 'with non-existing college_id' do
      it 'returns an error response' do
        post :enroll_user, params: {
          first_name: 'John',
          last_name: 'Doe',
          phone_number: '1234567890',
          college_id: 999, # Assuming college_id 999 does not exist
          exam_id: 1,
          start_time: Time.now
        }
        
        expect(response).to have_http_status(400)
        expect(JSON.parse(response.body)['error']).to eq("College with id: 999 doesn't exist")
      end
    end
  end
end
