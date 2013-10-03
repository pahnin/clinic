class Checkin < ActiveRecord::Base
  belongs_to :account
  self.per_page = 2
end
