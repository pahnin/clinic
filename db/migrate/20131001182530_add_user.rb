class AddUser < ActiveRecord::Migration
  def self.up
    user = User.create!( :email => 'demo@crmclinic.com', :password => 'demo1234' )
  end

  def self.down
    user = User.first
    user.destroy
  end
end
