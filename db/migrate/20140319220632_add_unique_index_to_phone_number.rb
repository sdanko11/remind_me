class AddUniqueIndexToPhoneNumber < ActiveRecord::Migration
  def up
    add_index :users, :phone_number, unique: true
  end

  def down
    remove_index :users, :phone_number
  end
  
end
