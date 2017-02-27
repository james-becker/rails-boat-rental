class CreateBoats < ActiveRecord::Migration[5.0]
  def change
    create_table :boats do |t|
      t.text :description
      t.string :category
      t.integer :capacity
      t.float :price
      t.string :location
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
