class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :name
      t.integer :active_status
      t.integer :sort_order

      t.timestamps
    end
  end
end
