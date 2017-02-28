class MakeDobString < ActiveRecord::Migration[5.0]
  def up
    change_table :users do |t|
      t.remove :dob
      t.string :dob
    end
  end

  def down
    change_table :users do |t|
      t.remove :dob
      t.integer :dob
    end
  end
end
