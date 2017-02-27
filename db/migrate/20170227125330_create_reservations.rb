class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :start_time
      t.string :end_time
      t.text :notes
      t.integer :count
      t.string :status
      t.belongs_to :user, foreign_key: true
      t.belongs_to :boat, foreign_key: true

      t.timestamps
    end
  end
end
