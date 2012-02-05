class RemoveAuthorization < ActiveRecord::Migration
  def up
    drop_table :authorizations
  end

  def down
  end
end
