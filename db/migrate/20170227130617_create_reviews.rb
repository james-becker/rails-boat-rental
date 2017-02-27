class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :stars
      t.belongs_to :reservation, foreign_key: true

      t.timestamps
    end
  end
end
