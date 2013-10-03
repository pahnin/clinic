class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :account_id

      t.timestamps
    end
  end
end
