class ChangeAgeToDob < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :age, :dob
  end
end
