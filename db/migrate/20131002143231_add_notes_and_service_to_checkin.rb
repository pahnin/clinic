class AddNotesAndServiceToCheckin < ActiveRecord::Migration
  def change
    add_column :checkins, :service, :string
    add_column :checkins, :notes, :string
  end
end
