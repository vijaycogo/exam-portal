# app/models/user.rb
class User < ApplicationRecord
  belongs_to :college
  belongs_to :exam
end
