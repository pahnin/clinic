class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.integer :age
      t.string :name
      t.string :sex

      t.timestamps
    end
  end
end
