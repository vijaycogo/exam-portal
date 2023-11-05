
require 'rails_helper'
RSpec.describe EnrollUserController, type: :controller do
  describe '#valid_params' do
    it 'returns success for valid parameters' do
      valid_params = {
        first_name: 'John',
        last_name: 'Doe',
        phone_number: '1234567890',
        college_id: 1,
        exam_id: 1,
        start_time: Time.now
      }
      controller.params.merge!(valid_params)
      controller.send(:valid_params)
      expect(controller.instance_variable_get(:@response_message)).to be_nil
    end
  end

  describe '#check_college_existence' do
    it 'returns success for an existing college' do
      allow(controller).to receive(:college_exist?).and_return(true)
      controller.send(:check_college_existence)
      expect(controller.instance_variable_get(:@response_message)).to be_nil
    end
  end

  describe '#check_college_exam_related' do
    it 'returns success for a valid exam associated with a college' do
      allow(controller).to receive(:college_exam_related?).and_return(true)
      controller.send(:check_college_exam_related)
      expect(controller.instance_variable_get(:@response_message)).to be_nil
    end
  end
end
