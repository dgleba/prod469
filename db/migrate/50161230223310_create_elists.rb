class CreateElists < ActiveRecord::Migration[5.0]
  def change
    create_table :elists do |t|
      t.string :email
      t.integer :active_status
      t.integer :sort_order

      t.timestamps
    end
  end
end
