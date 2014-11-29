class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :amount
      t.text :info
      t.timestamps
    end
  end
end
