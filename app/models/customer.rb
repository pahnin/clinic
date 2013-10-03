class Customer < ActiveRecord::Base
  has_many :accounts
  has_many :checkins, through: :accounts

  accepts_nested_attributes_for :accounts
end
