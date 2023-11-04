class User < ApplicationRecord
  belongs_to :college
  belongs_to :exam

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, length: { is: 10, message: "should be 10 characters long" }
  validates :college_id, presence: true
  validates :exam_id, presence: true
  validates :start_time, presence: true

  validate :validate_mobile_number, if: Proc.new { |t| t.phone_number.present? }
  private

  def validate_mobile_number
    unless phone_number.match(/\A\d{10}\z/)    
      errors.add(:phone_number, "is not in the correct format")
    end
  end
end
