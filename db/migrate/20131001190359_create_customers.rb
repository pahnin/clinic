class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :mobile_number

      t.timestamps
    end
  end
end
