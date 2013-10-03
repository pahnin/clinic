class Account < ActiveRecord::Base
  has_many :checkins
  belongs_to :customer
end
