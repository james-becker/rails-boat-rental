class RemoveAddressFromUsers < ActiveRecord::Migration[5.0]
  def up
    change_table :users do |t|
      t.remove :address
    end
  end

  def down
    change_table :users do |t|
      t.address :string
    end
  end
end
