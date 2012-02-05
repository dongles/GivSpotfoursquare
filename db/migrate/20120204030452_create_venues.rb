class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :logo_link

      t.timestamps
    end
  end
end
