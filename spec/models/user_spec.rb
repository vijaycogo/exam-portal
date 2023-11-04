require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first name presence' do
      user = User.new( last_name: 'Last' , phone_number: "7654983173", college_id: 1, exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures last name presence' do
      user = User.new( first_name: 'First' , phone_number: "7654983173", college_id: 1, exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures phone number presence' do
      user = User.new(first_name: "First", last_name: 'Last', college_id: 1, exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures college id presence' do
      user = User.new(first_name: "First", last_name: 'Last', phone_number: "7654983173", exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures exam id presence' do
      user = User.new(first_name: "First", last_name: 'Last', phone_number: "7654983173", college_id: 1, start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures start time presence' do
      user = User.new(first_name: "First", last_name: 'Last', phone_number: "7654983173", college_id: 1, exam_id: 2).save
      expect(user).to eq(false)
    end
  end
end
