class AddAddressToProjectsRemoveLocation < ActiveRecord::Migration[5.1]
  def change
    change_table :projects do |t|
      t.remove :location
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
    end
  end
end
