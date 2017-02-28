class RemoveColumnFromBoats < ActiveRecord::Migration[5.0]
  def up
    change_table :boats do |t|
      t.remove :reservations_count
    end
  end

  def down
    change_table :boats do |t|
      t.reservations_count :integer
    end
  end
end
