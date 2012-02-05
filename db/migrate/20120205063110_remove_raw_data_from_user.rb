class RemoveRawDataFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :raw_data
  end

  def down
  end
end
