class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :stars
      t.belongs_to :user, foreign_key: true
      t.belongs_to :boat, foreign_key: true

      t.timestamps
    end
  end
end
